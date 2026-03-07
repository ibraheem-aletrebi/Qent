import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/car_details/presentation/cubits/image_slider/images_slider_cubit.dart';
import 'package:quent/core/widgets/custom_cached_network_image.dart';

class ImagesMainImageSlider extends StatelessWidget {
  const ImagesMainImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ImagesSliderCubit>();
    return PageView.builder(
      controller: controller.pageController,
      itemCount: controller.images.length,
      onPageChanged: (index) => controller.onPageSwiped(index),
      itemBuilder: (_, i) => InteractiveViewer(
        minScale: 1.0,
        maxScale: 4.0,
        child: CachedImage(url: controller.images[i].image, fit: BoxFit.cover),
      ),
    );
  }
}
