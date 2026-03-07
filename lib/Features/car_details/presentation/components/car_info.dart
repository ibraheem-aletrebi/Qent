import 'package:flutter/material.dart';
import 'package:quent/Features/home/data/models/car_response_model/car_model.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/resources/font_weight_helper.dart';

class CarInfo extends StatelessWidget {
  const CarInfo({super.key, required this.car});
  final CarModel car;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w12,
        vertical: AppSizes.h16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  car.name ?? '—',
                  style: textTheme.titleLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  car.description ?? '',
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(Icons.star_rounded, color: Color(0xFFF5A623)),
                  const SizedBox(width: 4),
                  Text(
                    (car.reviewsAvg ?? 0.0).toStringAsFixed(1),
                    style: textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                '(${car.reviewsCount ?? 0} reviews)',
                style: textTheme.bodySmall?.copyWith(
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
