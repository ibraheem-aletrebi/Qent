import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quent/core/extensions/color_extension.dart';

class CachedImage extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final double? size;
  final BoxFit fit;
  final double radius;
  final bool circle;
  final Widget? fallback;
  final Color? bgColor;

  const CachedImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.size,
    this.fit = BoxFit.cover,
    this.radius = 0,
    this.circle = false,
    this.fallback,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.myColors;
    final w = size ?? width;
    final h = size ?? height;

    return Container(
      width: w,
      height: h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: bgColor ?? colors.surface,
        shape: circle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: circle ? null : BorderRadius.circular(radius),
      ),
      child: url == null || url!.trim().isEmpty
          ? Center(
              child:
                  fallback ??
                  Icon(Icons.image_outlined, color: colors.textHint),
            )
          : CachedNetworkImage(
              imageUrl: url!,
              fit: fit,
              width: w,
              height: h,
              placeholder: (_, _) => _Shimmer(color: colors.divider),
              errorWidget: (_, _, _) => Center(
                child:
                    fallback ??
                    Icon(Icons.broken_image_outlined, color: colors.textHint),
              ),
            ),
    );
  }
}

class _Shimmer extends StatefulWidget {
  final Color color;
  const _Shimmer({required this.color});

  @override
  State<_Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<_Shimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: Tween(
      begin: 0.3,
      end: 0.8,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut)),
    child: Container(color: widget.color),
  );
}
