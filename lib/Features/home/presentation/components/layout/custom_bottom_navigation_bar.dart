import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/home/presentation/components/layout/nav_item.dart';
import 'package:quent/Features/home/presentation/cubits/layout/layout_cubit.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:quent/core/resources/app_sizes.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        final layoutCubit = context.read<LayoutCubit>();
        final currentIndex = layoutCubit.currentIndex;
        final colors = context.myColors;
        return ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.r24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 5),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.w16,
                vertical: AppSizes.h12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.r24),
                gradient: LinearGradient(
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,
                  colors: [
                    colors.primary.withValues(alpha: 0.3),
                    colors.primary.withValues(alpha: 0.5),
                    colors.primary.withValues(alpha: 0.7),
                    colors.primary.withValues(alpha: 0.9),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  layoutCubit.bottomNavIcons.length,
                  (index) => NavItem(
                    icon: layoutCubit.bottomNavIcons[index],
                    isSelected: index == currentIndex,
                    onTap: () {
                      HapticFeedback.lightImpact();
                      layoutCubit.changeIndex(index);
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
