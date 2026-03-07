import 'package:flutter/material.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/widgets/custom_cached_network_image.dart';

class ImageThumbnails extends StatelessWidget {
  const ImageThumbnails({
    super.key,
    required this.images,
    required this.currentIndex,
    required this.onTap,
    required this.controller,
  });

  final List<String> images;
  final int currentIndex;
  final Function(int) onTap;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final colors = context.myColors;
    return SizedBox(
      height: AppSizes.h70,
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (_, i) {
          final selected = i == currentIndex;

          return GestureDetector(
            onTap: () => onTap(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 280),
              curve: Curves.easeOut,
              width: selected ? AppSizes.w80 : AppSizes.w70,
              margin: EdgeInsetsDirectional.only(end: AppSizes.w8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.r20),
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedImage(url: images[i], fit: BoxFit.cover),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 250),
                    opacity: selected ? 0 : 0.50,
                    child: Container(color: colors.surface),
                  ),

                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: selected
                        ? Align(
                            key: const ValueKey("selected"),
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Container(
                                width: AppSizes.w18,
                                height: AppSizes.w18,
                                decoration: BoxDecoration(
                                  color: colors.surface,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.check,
                                  size: 12,
                                  color: colors.textPrimary,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(key: ValueKey("unselected")),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
