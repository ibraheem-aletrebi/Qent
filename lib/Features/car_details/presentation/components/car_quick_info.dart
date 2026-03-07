import 'package:flutter/material.dart';
import 'package:quent/Features/home/data/models/car_response_model/car_model.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/utils/format_number.dart';

class CarQuickInfo extends StatelessWidget {
  const CarQuickInfo({super.key, required this.car});
  final CarModel car;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                car.name ?? '—',
                style: textTheme.headlineSmall?.copyWith(letterSpacing: -0.3),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: AppSizes.h4),
              if (car.isForRent == true && car.dailyRent != null)
                Text(
                  '\$${car.dailyRent} / day',
                  style: textTheme.titleLarge?.copyWith(
                    color: Color(0xFFF5A623),
                  ),
                )
              else if (car.price != null)
                Text(
                  '\$${formatNumber(num.parse(car.price))}',
                  style: textTheme.titleLarge?.copyWith(
                    color: Color(0xFFF5A623),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
