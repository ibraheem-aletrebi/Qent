import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/home/presentation/components/layout/custom_bottom_navigation_bar.dart';
import 'package:quent/Features/home/presentation/cubits/layout/layout_cubit.dart';
import 'package:quent/core/resources/app_sizes.dart';

class MainLayoutView extends StatelessWidget {
  const MainLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final layoutCubit = context.watch<LayoutCubit>();
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: IndexedStack(
                index: layoutCubit.currentIndex,
                children: layoutCubit.screens,
              ),
            ),
            Positioned(
              left: AppSizes.w16,
              right: AppSizes.w16,
              bottom: AppSizes.h16,
              child: CustomBottomNavigationBar(),
            ),
          ],
        ),
      ),
    );
  }
}
