import 'package:flutter/material.dart';
import 'package:quent/Features/home/presentation/components/home/home_sliver_app_bar.dart';
import 'package:quent/Features/home/presentation/components/home/home_sliver_best_cars_sections.dart';
import 'package:quent/Features/home/presentation/components/home/home_sliver_branding_section.dart';
import 'package:quent/Features/home/presentation/components/home/home_sliver_nearby_cars_sections.dart';
import 'package:quent/core/resources/app_sizes.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        HomeSliverAppBar(),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        HomeSliverBrandingSection(),
        SliverToBoxAdapter(child: SizedBox(height: 24)),
        HomeSliverBestCarsSections(),
        SliverToBoxAdapter(child: SizedBox(height: 24)),
        HomeSliverNearbyCarsSections(),
        SliverToBoxAdapter(child: SizedBox(height: AppSizes.h100)),
      ],
    );
  }
}
