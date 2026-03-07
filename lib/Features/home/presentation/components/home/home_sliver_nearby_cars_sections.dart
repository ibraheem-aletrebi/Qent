import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/home/data/models/car_response_model/car_model.dart';
import 'package:quent/Features/home/presentation/components/home/nearby_car_card.dart';
import 'package:quent/Features/home/presentation/cubits/nearby_cars/nearby_cars_cubit.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/widgets/loading_widget.dart';
import 'package:quent/core/widgets/section_header.dart';

class HomeSliverNearbyCarsSections extends StatefulWidget {
  const HomeSliverNearbyCarsSections({super.key});

  @override
  State<HomeSliverNearbyCarsSections> createState() =>
      _HomeSliverNearbyCarsSectionsState();
}

class _HomeSliverNearbyCarsSectionsState
    extends State<HomeSliverNearbyCarsSections> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_isNearEnd()) return;
    final cubit = context.read<NearbyCarsCubit>();
    final state = cubit.state;
    if (state is NearbyCarsLoaded && state.hasMore) {
      cubit.fetchNearbyCars(loadMore: true);
    }
  }

  bool _isNearEnd() {
    if (!_scrollController.hasClients) return false;
    final position = _scrollController.position;
    if (position.maxScrollExtent == 0) return false;
    return position.pixels >= position.maxScrollExtent * 0.8;
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: 'Nearby Cars', onActionTap: () {}),
          SizedBox(height: AppSizes.h4),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: BlocBuilder<NearbyCarsCubit, NearbyCarsState>(
              builder: (context, state) {
                final cars = switch (state) {
                  NearbyCarsLoaded(:final cars) => cars,
                  NearbyCarsLoadingMore(:final cars) => cars,
                  NearbyCarsLoadingMoreFailure(:final cars) => cars,
                  NearbyCarsLoading() => List.generate(
                    4,
                    (_) => CarModel.placeholder(), // ← شوف تعليق تحت
                  ),
                  _ => <CarModel>[],
                };

                final isLoadingMore = state is NearbyCarsLoadingMore;

                return ListView.separated(
                  controller: _scrollController,
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.w12),
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: cars.length + (isLoadingMore ? 1 : 0),
                  separatorBuilder: (_, _) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    if (isLoadingMore && index == cars.length) {
                      return Center(child: LoadingWidget(size: AppSizes.w24));
                    }
                    return SizedBox(
                      width: screenWidth * 0.7,
                      child: NearbyCarCard(car: cars[index]),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
