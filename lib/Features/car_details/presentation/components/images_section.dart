import 'package:flutter/material.dart';
import 'package:quent/Features/car_details/presentation/components/full_screen_gallery.dart';
import 'package:quent/Features/car_details/presentation/components/image_counter_badge.dart';
import 'package:quent/Features/car_details/presentation/components/image_overlay_info.dart';
import 'package:quent/Features/car_details/presentation/components/image_top_actions.dart';
import 'package:quent/Features/car_details/presentation/components/images_main_slider.dart';
import 'package:quent/Features/car_details/presentation/components/images_thumbnails.dart';
import 'package:quent/Features/home/data/models/car_response_model/car_model.dart';
import 'package:quent/core/resources/app_sizes.dart';

class ImagesSection extends StatefulWidget {
  const ImagesSection({super.key, required this.car});
  final CarModel car;
  @override
  State<ImagesSection> createState() => _ImagesSectionState();
}

class _ImagesSectionState extends State<ImagesSection>
    with TickerProviderStateMixin {
  int _currentImage = 0;
  bool _isFavorite = false;
  late final PageController _pageController;
  final ScrollController _thumbScroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _thumbScroll.dispose();
    super.dispose();
  }

  void _openFullScreen(BuildContext context, List<String> imgs) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black,
        pageBuilder: (_, __, ___) =>
            FullScreenGallery(images: imgs, initialIndex: _currentImage),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final imgs = <String>[
      'https://images.unsplash.com/photo-1617788138017-80ad40651399?w=800',
      'https://images.unsplash.com/photo-1544636331-e26879cd4d9b?w=800',
      'https://images.unsplash.com/photo-1555215695-3004980ad54e?w=800',
      'https://images.unsplash.com/photo-1494976388531-d1058494cdd8?w=800',
    ];

    final imageHeight = MediaQuery.of(context).size.height * 0.32;

    return Column(
      children: [
        SizedBox(
          height: imageHeight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.r24),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ImagesMainImageSlider(
                  images: imgs,
                  controller: _pageController,
                  onPageChanged: (i) => setState(() => _currentImage = i),
                ),

                PositionedDirectional(
                  start: AppSizes.w12,
                  top: AppSizes.h12,
                  child: ImageCounterBadge(
                    index: _currentImage,
                    total: imgs.length,
                  ),
                ),

                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ImageOverlayInfo(
                    car: widget.car,
                    currentIndex: _currentImage,
                    total: imgs.length,
                  ),
                ),

                PositionedDirectional(
                  top: AppSizes.h12,
                  end: AppSizes.w12,
                  child: ImageTopActions(
                    onFavoriteTap: () => _isFavorite = !_isFavorite,
                    onFullScreenTap: () => _openFullScreen(context, imgs),
                    isFavorite: _isFavorite,
                  ),
                ),
              ],
            ),
          ),
        ),

        if (imgs.length > 1) ...[
          SizedBox(height: AppSizes.h16),
          ImageThumbnails(
            images: imgs,
            currentIndex: _currentImage,
            onTap: (i) => setState(() => _pageController.jumpToPage(i)),
            controller: _thumbScroll,
          ),
        ],
      ],
    );
  }
}
