import 'package:flutter/material.dart';
import 'package:quent/Features/home/presentation/components/home/nearby_car_card.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/widgets/section_header.dart';

class HomeSliverNearbyCarsSections extends StatelessWidget {
  const HomeSliverNearbyCarsSections({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: 'Nearby Cars', onActionTap: () {}),
          SizedBox(height: AppSizes.h4),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.w12),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: 8,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: screenWidth * 0.7,
                  child: NearbyCarCard(
                    imageUrl:
                        'https://www.reuters.com/resizer/v2/TLF3WPWNKBL25PYXC7OS6IVIEM.jpg?auth=780660df0ed764bd397b00164ae5a9129f657db6de5821a123a50243dccd9bef&width=1920&quality=80',
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
