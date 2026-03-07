import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/car_details/presentation/components/car_details_bottom_bar.dart';
import 'package:quent/Features/car_details/presentation/components/car_details_sliver_app_bar.dart';
import 'package:quent/Features/car_details/presentation/components/car_features_section.dart';
import 'package:quent/Features/car_details/presentation/components/car_info.dart';
import 'package:quent/Features/car_details/presentation/components/car_reviews_section.dart';
import 'package:quent/Features/car_details/presentation/components/images_section.dart';
import 'package:quent/Features/car_details/presentation/components/owner_card.dart';
import 'package:quent/Features/car_details/presentation/cubits/image_slider/images_slider_cubit.dart';
import 'package:quent/Features/home/data/models/car_response_model/car_model.dart';
import 'package:quent/core/resources/app_sizes.dart';

class CarDetailsView extends StatefulWidget {
  final CarModel car;
  const CarDetailsView({super.key, required this.car});

  @override
  State<CarDetailsView> createState() => _CarDetailsViewState();
}

class _CarDetailsViewState extends State<CarDetailsView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ImagesSliderCubit()..init(images: widget.car.images!),
        ),
        // BlocProvider(create: (context) => SubjectBloc()),
      ],
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              CarDetailsSliverAppBar(),
              SliverToBoxAdapter(child: const SizedBox(height: 16)),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.w12),
                sliver: SliverToBoxAdapter(
                  child: ImagesSection(car: widget.car),
                ),
              ),
              SliverToBoxAdapter(child: CarInfo(car: widget.car)),
              SliverToBoxAdapter(child: OwnerCard(car: widget.car)),
              SliverToBoxAdapter(child: CarFeaturesSection(car: widget.car)),
              SliverToBoxAdapter(child: const SizedBox(height: 16)),
              SliverToBoxAdapter(child: CarReviewsSection(car: widget.car)),
              SliverToBoxAdapter(child: SizedBox(height: AppSizes.h16)),
            ],
          ),
        ),
        bottomNavigationBar: CarDetailsBottomBar(car: widget.car),
      ),
    );
  }
}
