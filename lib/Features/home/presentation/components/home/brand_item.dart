import 'package:flutter/material.dart';
import 'package:quent/Features/home/data/models/brands_response_model.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/widgets/custom_cached_network_image.dart';

class BrandItem extends StatelessWidget {
  final BrandModel brand;
  const BrandItem({super.key, required this.brand});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(AppSizes.r50),
            child: CachedImage(
              url:
                  'https://images.unsplash.com/photo-1574015974293-817f0ebebb74?q=80&w=1273&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              size: AppSizes.w80,
            ),
          ),

          SizedBox(height: AppSizes.h8),
          Text(
            brand.name,
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
