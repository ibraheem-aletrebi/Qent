import 'package:flutter/material.dart';
import 'package:quent/Features/home/data/models/car_response_model/car_model.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/resources/font_weight_helper.dart';
import 'package:quent/core/utils/format_number.dart';
import 'package:quent/core/widgets/custom_button.dart';

class CarDetailsBottomBar extends StatelessWidget {
  const CarDetailsBottomBar({super.key, required this.car});
  final CarModel car;
  @override
  Widget build(BuildContext context) {
    final num price = num.parse(
      car.isForRent == true ? car.dailyRent : car.price,
    );
    final colors = context.myColors;
    final textTheme = TextTheme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w16,
        vertical: AppSizes.h24,
      ),

      decoration: BoxDecoration(
        color: colors.surface,

        boxShadow: [
          BoxShadow(
            color: colors.border.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '\$${formatNumber(price)}${car.isForRent == true ? ' / Day' : ''}',
                style: textTheme.titleLarge,
              ),
              Text(
                car.isForRent == true ? 'Rental Price' : 'Sale Price',
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: CustomButton(
              text: 'Book Now',
              onPressed: () {},
              icon: Icons.arrow_forward_ios_rounded,
              iconAlignment: IconAlignment.end,
              borderRadius: AppSizes.r20,
              shadowColor: colors.shadow,
            ),
          ),
        ],
      ),
    );
  }
}
