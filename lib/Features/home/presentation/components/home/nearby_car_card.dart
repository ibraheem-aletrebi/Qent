import 'package:flutter/material.dart';
import 'package:quent/Features/home/data/models/car_response_model/car_model.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/widgets/custom_cached_network_image.dart';

class NearbyCarCard extends StatelessWidget {
  final CarModel car;

  const NearbyCarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.r16),
        child: AspectRatio(
          aspectRatio: 16 / 12,
          child: CachedImage(
            url:
                'https://images.unsplash.com/photo-1596157783429-027a9773431a?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGJtdyUyMGU0NnxlbnwwfHwwfHx8MA%3D%3D',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
