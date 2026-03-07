import 'package:flutter/material.dart';
import 'package:quent/Features/home/data/models/car_response_model/car_feature.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/resources/font_weight_helper.dart';
import 'package:quent/core/widgets/custom_cached_network_image.dart';

class FeatureCard extends StatelessWidget {
  final CarFeature feature;
  const FeatureCard({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    final colors = context.myColors;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(AppSizes.w12),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppSizes.r12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CachedImage(
            url: feature.image,
            fit: BoxFit.contain,
            size: AppSizes.w40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2,
            children: [
              Text(feature.name, style: textTheme.titleSmall),
              Text(
                feature.value,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
