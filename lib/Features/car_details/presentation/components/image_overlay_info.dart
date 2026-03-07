import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/car_details/presentation/components/car_quick_info.dart';
import 'package:quent/Features/car_details/presentation/cubits/image_slider/images_slider_cubit.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/widgets/dots_indicator.dart';
import 'package:quent/Features/home/data/models/car_response_model/car_model.dart';

class ImageOverlayInfo extends StatelessWidget {
  const ImageOverlayInfo({super.key, required this.car});

  final CarModel car;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.w12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, context.myColors.surface],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        crossAxisAlignment: .end,
        children: [
          Expanded(child: CarQuickInfo(car: car)),
          DotsIndicator(
            current: context.watch<ImagesSliderCubit>().currentIndex,
            total: context.read<ImagesSliderCubit>().images.length,
          ),
        ],
      ),
    );
  }
}
