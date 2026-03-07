import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/car_details/presentation/components/full_screen_gallery.dart';
import 'package:quent/Features/car_details/presentation/components/image_counter_badge.dart';
import 'package:quent/Features/car_details/presentation/components/image_overlay_info.dart';
import 'package:quent/Features/car_details/presentation/components/image_top_actions.dart';
import 'package:quent/Features/car_details/presentation/components/images_main_slider.dart';
import 'package:quent/Features/car_details/presentation/components/images_thumbnails.dart';
import 'package:quent/Features/car_details/presentation/cubits/image_slider/images_slider_cubit.dart';
import 'package:quent/Features/home/data/models/car_response_model/car_model.dart';
import 'package:quent/core/resources/app_sizes.dart';

class ImagesSection extends StatelessWidget {
  const ImagesSection({super.key, required this.car});
  final CarModel car;

  void _openFullScreen(BuildContext context, List<String> imgs, int index) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black,
        pageBuilder: (_, _, _) => FullScreenGallery(
          images: context.read<ImagesSliderCubit>().images,
          initialIndex: index,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final imgs = car.images?.map((e) => e.image).toList() ?? [];
    final imageHeight = MediaQuery.sizeOf(context).height * 0.35;
    return Column(
      children: [
        SizedBox(
          height: imageHeight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.r24),
            child: Stack(
              fit: StackFit.expand,
              children: [
                const ImagesMainImageSlider(),
                BlocBuilder<ImagesSliderCubit, ImagesSliderState>(
                  builder: (context, state) {
                    final currentIndex = state.currentIndex;
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        PositionedDirectional(
                          start: AppSizes.w12,
                          top: AppSizes.h12,
                          child: ImageCounterBadge(
                            index: currentIndex,
                            total: imgs.length,
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: ImageOverlayInfo(car: car),
                        ),
                        PositionedDirectional(
                          top: AppSizes.h12,
                          end: AppSizes.w12,
                          child: ImageTopActions(
                            onFavoriteTap: () {},
                            onFullScreenTap: () =>
                                _openFullScreen(context, imgs, currentIndex),
                            isFavorite: false,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        if (imgs.length > 1) ...[
          SizedBox(height: AppSizes.h16),
          const ImageThumbnails(),
        ],
      ],
    );
  }
}
