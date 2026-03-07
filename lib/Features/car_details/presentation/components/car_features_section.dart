import 'package:flutter/material.dart';
import 'package:quent/Features/car_details/presentation/components/feature_card.dart';
import 'package:quent/Features/home/data/models/car_response_model/car_model.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/widgets/section_header.dart';

class CarFeaturesSection extends StatelessWidget {
  const CarFeaturesSection({super.key, required this.car});
  final CarModel car;
  @override
  Widget build(BuildContext context) {
    final features = car.carFeatures ?? [];
    if (features.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.w16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Car features', padding: EdgeInsets.zero),
          const SizedBox(height: 12),
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.15,
            ),
            itemCount: features.length,
            itemBuilder: (_, i) => FeatureCard(feature: features[i]),
          ),
        ],
      ),
    );
  }
}
