import 'package:flutter/material.dart';
import 'package:quent/core/resources/app_sizes.dart';

class ImageCounterBadge extends StatelessWidget {
  const ImageCounterBadge({
    super.key,
    required this.index,
    required this.total,
  });

  final int index;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w8,
        vertical: AppSizes.h6,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppSizes.r20),
      ),
      child: Row(
        spacing: 5,
        children: [
          Icon(Icons.camera_alt_outlined, color: Colors.white),
          Text(
            '${index + 1} / $total',
            style: TextTheme.of(
              context,
            ).bodyMedium?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
