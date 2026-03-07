import 'package:flutter/material.dart';
import 'package:quent/Features/home/data/models/car_response_model/review_model.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/resources/font_weight_helper.dart';
import 'package:quent/core/widgets/custom_cached_network_image.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel review;
  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final colors = context.myColors;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w8,
        vertical: AppSizes.h16,
      ),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppSizes.r20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(AppSizes.r50),
                child: CachedImage(
                  url:
                      'https://plus.unsplash.com/premium_photo-1661582266427-c3054efeab65?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fG93bmVyfGVufDB8fDB8fHww',
                  size: AppSizes.w40,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  review.username ?? 'Anonymous',
                  style: textTheme.titleMedium,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star_rounded, color: Color(0xFFF5A623)),
                  const SizedBox(width: 4),
                  Text(
                    '${review.rate ?? 0}.0',
                    style: textTheme.titleSmall?.copyWith(height: 1.6),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            review.review ?? '',
            style: textTheme.bodyMedium?.copyWith(
              height: 1.5,
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
