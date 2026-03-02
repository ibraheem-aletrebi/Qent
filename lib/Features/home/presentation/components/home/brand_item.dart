import 'package:flutter/material.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:quent/core/resources/app_sizes.dart';

class BrandItem extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;

  const BrandItem({super.key, required this.imageUrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: AppSizes.r40 * 2,
            width: AppSizes.r40 * 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: AppSizes.h4),
          Text(
            'Brand name',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: context.myColors.textPrimary,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
