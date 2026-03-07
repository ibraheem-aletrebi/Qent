import 'package:flutter/material.dart';
import 'package:quent/Features/car_details/presentation/view/car_details_view.dart';
import 'package:quent/Features/home/data/models/car_response_model/car_model.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:quent/core/extensions/navigation_extension.dart';
import 'package:quent/core/utils/format_number.dart';
import 'package:quent/core/widgets/custom_cached_network_image.dart';

class BestCarCard extends StatelessWidget {
  final CarModel car;

  const BestCarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = context.myColors;
    return GestureDetector(
      onTap: () {
        context.push(CarDetailsView(car: car));
      },
      child: Container(
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colors.surface),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: CachedImage(
                      url:
                          'https://images.unsplash.com/photo-1542362567-b07e54358753?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGNhcnxlbnwwfHwwfHx8MA%3D%3D',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: colors.surface,
                    ),
                    onPressed: () {},
                    icon: Icon(
                      false ? Icons.favorite : Icons.favorite_border,
                      color: false ? colors.primary : colors.primaryVariant,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.name ?? 'fuck',
                    style: theme.textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        car.averageRate.toString(),
                        style: theme.textTheme.titleSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          car.location?.name ?? 'fuck',
                          style: theme.textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.event_seat),
                          const SizedBox(width: 4),
                          Text(
                            '${car.seatingCapacity} Seats',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Text(
                        car.price == null
                            ? 'For Free'
                            : "${formatNumber(num.parse(car.price))}/Day",
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
