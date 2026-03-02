import 'package:flutter/material.dart';
import 'package:quent/core/resources/app_sizes.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w24,
          vertical: AppSizes.h12,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withValues(alpha: 0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(AppSizes.r16),
        ),
        child: AnimatedScale(
          scale: isSelected ? 1.2 : 1.1,
          duration: const Duration(milliseconds: 300),
          child: Icon(
            icon,
            size: 24,
            color: isSelected
                ? Colors.white
                : Colors.white.withValues(alpha: .5),
          ),
        ),
      ),
    );
  }
}
