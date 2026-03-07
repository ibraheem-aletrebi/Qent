import 'package:flutter/material.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/Features/car_details/presentation/components/circle_btn.dart';

class CarDetailsSliverAppBar extends StatelessWidget {
  const CarDetailsSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      pinned: false,
      leadingWidth: AppSizes.w50,
      leading: Padding(
        padding: EdgeInsetsDirectional.only(start: AppSizes.w16),
        child: CircleBtn(
          onTap: () => Navigator.maybePop(context),
          child: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
        ),
      ),
      title: Text('Car Details', style: TextTheme.of(context).titleLarge),
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, AppSizes.h12),
        child: Divider(color: context.myColors.secondary),
      ),
      actions: [
        Padding(
          padding: EdgeInsetsDirectional.only(end: AppSizes.w16),
          child: CircleBtn(
            onTap: () {},
            child: const Icon(Icons.more_horiz_rounded, size: 22),
          ),
        ),
      ],
    );
  }
}
