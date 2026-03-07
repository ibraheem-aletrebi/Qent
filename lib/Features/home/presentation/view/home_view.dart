import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/home/presentation/components/home/home_view_body.dart';
import 'package:quent/Features/home/presentation/cubits/best_cars/best_cars_cubit.dart';
import 'package:quent/Features/home/presentation/cubits/brands/brand_cubit.dart';
import 'package:quent/Features/home/presentation/cubits/nearby_cars/nearby_cars_cubit.dart';
import 'package:quent/injector.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              BrandCubit(fetchBrandsUseCase: sl())..fetchBrands(),
        ),
        BlocProvider(
          create: (context) =>
              BestCarsCubit(fetchBestCarsUseCase: sl())..fetchBestCars(),
        ),
        BlocProvider(
          create: (context) =>
              NearbyCarsCubit(fetchNearbyCarsUseCase: sl())..fetchNearbyCars(),
        ),
      ],
      child: HomeViewBody(),
    );
  }
}
