import 'package:flutter/material.dart';
import 'package:quent/Features/car_details/presentation/components/review_card.dart';
import 'package:quent/Features/home/data/models/car_response_model/car_model.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/widgets/section_header.dart';

class CarReviewsSection extends StatelessWidget {
  const CarReviewsSection({super.key, required this.car});
  final CarModel car;
  @override
  Widget build(BuildContext context) {
    final reviews = car.reviews ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Reviews (${car.reviewsCount ?? 0})',
          onActionTap: () {},
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.13,
          child: ListView.builder(
            padding: EdgeInsetsDirectional.only(start: AppSizes.w16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsetsDirectional.only(end: AppSizes.w16),
              child: ReviewCard(review: reviews[index]),
            ),
            itemCount: reviews.length,
          ),
        ),
      ],
    );
  }
}
