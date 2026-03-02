import 'package:flutter/material.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/widgets/custom_logo.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: context.myColors.background,
      surfaceTintColor: Colors.transparent, // مهم جداً: منع تغير اللون
      elevation: 0, // منع الظل
      scrolledUnderElevation: 0, // منع تغير اللون تحت الـ scroll
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, thickness: 1),
      ),
      leading: const SizedBox.shrink(),
      centerTitle: false,
      toolbarHeight: AppSizes.h80,
      title: CustomLogo(size: AppSizes.w80),
      actionsPadding: EdgeInsets.only(right: AppSizes.w16, left: AppSizes.w8),
      actions: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            IconButton.filled(
              style: IconButton.styleFrom(
                backgroundColor: context.myColors.primarySoft,
                minimumSize: Size(AppSizes.w45, AppSizes.w45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.r12),
                ),
              ),
              onPressed: () {},
              icon: Icon(Icons.notifications_none_rounded, size: AppSizes.w24),
            ),
            Positioned(
              top: -AppSizes.h6,
              right: -AppSizes.w4,
              child: Container(
                padding: EdgeInsets.all(AppSizes.w4),
                constraints: BoxConstraints(
                  minWidth: AppSizes.w20,
                  minHeight: AppSizes.h20,
                ),
                decoration: BoxDecoration(
                  color: context.myColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '3',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: AppSizes.w12),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: context.myColors.primary,
              width: AppSizes.w2,
            ),
          ),
          child: CircleAvatar(
            radius: AppSizes.r24,
            backgroundImage: const NetworkImage(
              "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde",
            ),
          ),
        ),
      ],
    );
  }
}
