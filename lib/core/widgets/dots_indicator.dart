import 'package:flutter/material.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:quent/core/resources/app_sizes.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({super.key, required this.current, required this.total});
  final int current;
  final int total;
  @override
  Widget build(BuildContext context) {
    final colors = context.myColors;
    return Row(
      children: List.generate(total, (i) {
        final active = i == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: active ? AppSizes.w18 : AppSizes.w5,
          height: AppSizes.w5,
          decoration: BoxDecoration(
            color: active
                ? colors.textPrimary
                : colors.textPrimary.withValues(alpha: 0.45),
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }
}
