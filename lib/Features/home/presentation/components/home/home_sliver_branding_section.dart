import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/home/data/models/brands_response_model/brand_model.dart';
import 'package:quent/Features/home/presentation/components/home/brand_item.dart';
import 'package:quent/Features/home/presentation/cubits/brands/brand_cubit.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/widgets/custom_skeletonizer.dart';
import 'package:quent/core/widgets/loading_widget.dart';
import 'package:quent/core/widgets/section_header.dart';
import 'package:quent/generated/l10n.dart';

class HomeSliverBrandingSection extends StatefulWidget {
  const HomeSliverBrandingSection({super.key});

  @override
  State<HomeSliverBrandingSection> createState() =>
      _HomeSliverBrandingSectionState();
}

class _HomeSliverBrandingSectionState extends State<HomeSliverBrandingSection> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_isNearEnd()) return;
    final cubit = context.read<BrandCubit>();
    final state = cubit.state;
    if (state is BrandLoaded && state.hasMore) {
      cubit.fetchBrands(loadMore: true);
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
    final height = MediaQuery.sizeOf(context).height * 0.15;
    final translate = S.of(context);
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: translate.Branding, onActionTap: () {}),
          const SizedBox(height: 12),
          SizedBox(
            height: height,
            child: BlocBuilder<BrandCubit, BrandState>(
              builder: (context, state) {
                final brands = switch (state) {
                  BrandLoaded(:final brandList) => brandList,
                  BrandLoadingMore(:final brandList) => brandList,
                  BrandLoadingMoreFailure(:final brandList) => brandList,
                  BrandLoading() => List.generate(
                    4,
                    (_) => BrandModel(id: 0, name: 'Loading', image: ''),
                  ),
                  _ => <BrandModel>[],
                };
                return CustomSkeletonizer(
                  isLoading: state is BrandLoading,
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: AppSizes.w12),
                          ...List.generate(
                            brands.length,
                            (index) => Padding(
                              padding: EdgeInsets.only(right: AppSizes.w24),
                              child: BrandItem(brand: brands[index]),
                            ),
                          ),
                          if (state is BrandLoadingMore)
                            Padding(
                              padding: EdgeInsets.only(right: AppSizes.w12),
                              child: Center(
                                child: LoadingWidget(size: AppSizes.w24),
                              ),
                            ),
                        ],
                      ),
                    ),
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
