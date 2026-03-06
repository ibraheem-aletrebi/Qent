import 'package:flutter/material.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSkeletonizer extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const CustomSkeletonizer({
    super.key,
    required this.child,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      effect: ShimmerEffect(
        duration: Duration(milliseconds: 1200),
        baseColor: context.myColors.surface,
        highlightColor: context.myColors.primary.withValues(alpha: .5),
      ),
      child: child,
    );
  }
}
