import 'package:flutter/material.dart';
import 'package:quent/core/widgets/custom_cached_network_image.dart';

class ImagesMainImageSlider extends StatelessWidget {
  const ImagesMainImageSlider({
    super.key,
    required this.images,
    required this.controller,
    required this.onPageChanged,
  });

  final List<String> images;
  final PageController controller;
  final Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: images.length,
      onPageChanged: onPageChanged,
      itemBuilder: (_, i) => InteractiveViewer(
        minScale: 1.0,
        maxScale: 4.0,
        child: CachedImage(url: images[i], fit: BoxFit.cover),
      ),
    );
  }
}
