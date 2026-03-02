import 'package:flutter/material.dart';
import 'package:quent/core/resources/app_sizes.dart';

class NearbyCarCard extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? onTap;

  const NearbyCarCard({super.key, required this.imageUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.r16),
        child: AspectRatio(
          aspectRatio: 16 / 12,
          child: Image.network(imageUrl, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
