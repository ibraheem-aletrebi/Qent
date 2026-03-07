import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/home/data/models/car_response_model/car_model.dart';
import 'package:quent/Features/home/presentation/components/home/best_car_card.dart';
import 'package:quent/Features/home/presentation/cubits/best_cars/best_cars_cubit.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/widgets/custom_skeletonizer.dart';
import 'package:quent/core/widgets/loading_widget.dart';
import 'package:quent/core/widgets/section_header.dart';

class HomeSliverBestCarsSections extends StatefulWidget {
  const HomeSliverBestCarsSections({super.key});

  @override
  State<HomeSliverBestCarsSections> createState() =>
      _HomeSliverBestCarsSectionsState();
}

class _HomeSliverBestCarsSectionsState
    extends State<HomeSliverBestCarsSections> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_isNearEnd()) return;
    final cubit = context.read<BestCarsCubit>();
    final state = cubit.state;
    if (state is BestCarsLoaded && state.hasMore) {
      cubit.fetchBestCars(loadMore: true);
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
    final screenWidth = MediaQuery.sizeOf(context).width;

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: 'Best Cars', onActionTap: () {}),
          SizedBox(height: AppSizes.h4),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.4,
            child: BlocBuilder<BestCarsCubit, BestCarsState>(
              builder: (context, state) {
                final cars = switch (state) {
                  BestCarsLoaded(:final cars) => cars,
                  BestCarsLoadingMore(:final cars) => cars,
                  BestCarsLoadingMoreFailure(:final cars) => cars,
                  BestCarsLoading() => List.generate(
                    4,
                    (_) => CarModel.placeholder(), // ← شوف تعليق تحت
                  ),
                  _ => <CarModel>[],
                };

                final isLoadingMore = state is BestCarsLoadingMore;

                return CustomSkeletonizer(
                  isLoading: state is BestCarsLoading,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.w12),
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: cars.length + (isLoadingMore ? 1 : 0),
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      if (isLoadingMore && index == cars.length) {
                        return Center(child: LoadingWidget(size: AppSizes.w24));
                      }
                      return SizedBox(
                        width: screenWidth * 0.7,
                        child: BestCarCard(car: cars[index]),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
