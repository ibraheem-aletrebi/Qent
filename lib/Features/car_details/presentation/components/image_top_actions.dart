import 'package:flutter/material.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/widgets/custom_glass_button.dart';

class ImageTopActions extends StatelessWidget {
  const ImageTopActions({
    super.key,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.onFullScreenTap,
  });

  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback onFullScreenTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSizes.h10,
      children: [
        CustomGlassButton(
          onTap: onFavoriteTap,
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.white,
          ),
        ),
        CustomGlassButton(
          onTap: () {},
          child: const Icon(Icons.share_rounded, color: Colors.white),
        ),
        CustomGlassButton(
          onTap: onFullScreenTap,
          child: const Icon(Icons.fullscreen_rounded, color: Colors.white),
        ),
      ],
    );
  }
}
