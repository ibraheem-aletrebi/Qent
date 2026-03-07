import 'package:flutter/material.dart';
import 'package:quent/Features/car_details/presentation/components/circle_btn.dart';
import 'package:quent/Features/home/data/models/car_response_model/car_model.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/widgets/custom_cached_network_image.dart';

class OwnerCard extends StatelessWidget {
  const OwnerCard({super.key, required this.car});
  final CarModel car;
  @override
  Widget build(BuildContext context) {
    final colors = context.myColors;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
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
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(AppSizes.r50),
                child: CachedImage(
                  url:
                      'https://plus.unsplash.com/premium_photo-1661582266427-c3054efeab65?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fG93bmVyfGVufDB8fDB8fHww',
                  size: AppSizes.w50,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: AppSizes.w14,
                  height: AppSizes.w14,
                  decoration: BoxDecoration(
                    color: colors.success,
                    shape: BoxShape.circle,
                    border: Border.all(color: colors.textPrimary, width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(car.brand?.name ?? 'Owner', style: textTheme.titleLarge),
                Text(car.location?.name ?? '', style: textTheme.titleSmall),
              ],
            ),
          ),
          CircleBtn(child: Icon(Icons.call_outlined), onTap: () {}),
          SizedBox(width: AppSizes.w18),
          CircleBtn(
            child: Icon(Icons.chat_bubble_outline_rounded),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
