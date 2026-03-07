import 'package:quent/Features/home/data/models/brands_response_model/brand_model.dart';
import 'package:quent/core/models/location_model.dart';
import 'car_feature.dart';
import 'color_model.dart';
import 'image_model.dart';
import 'review_model.dart';

class CarModel {
  final int? id;
  final String? name;
  final String? description;
  final int? owner;
  final String? firstImage;
  final List<ImageModel>? images;
  final String? carType;
  final BrandModel? brand;
  final ColorModel? color;
  final List<CarFeature>? carFeatures;
  final String? seatingCapacity;
  final LocationModel? location;
  final int? averageRate;
  final bool? isForRent;
  final String? dailyRent;
  final String? weeklyRent;
  final String? monthlyRent;
  final String? yearlyRent;
  final bool? isForPay;
  final dynamic price;
  final bool? availableToBook;
  final List<ReviewModel>? reviews;
  final int? reviewsCount;
  final double? reviewsAvg;

  const CarModel({
    this.id,
    this.name,
    this.description,
    this.owner,
    this.firstImage,
    this.images,
    this.carType,
    this.brand,
    this.color,
    this.carFeatures,
    this.seatingCapacity,
    this.location,
    this.averageRate,
    this.isForRent,
    this.dailyRent,
    this.weeklyRent,
    this.monthlyRent,
    this.yearlyRent,
    this.isForPay,
    this.price,
    this.availableToBook,
    this.reviews,
    this.reviewsCount,
    this.reviewsAvg,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    owner: json['owner'] as int?,
    firstImage: json['first_image'] as String?,
    images: (json['images'] as List<dynamic>?)
        ?.map((e) => ImageModel.fromMap(e as Map<String, dynamic>))
        .toList(),
    carType: json['car_type'] as String?,
    brand: json['brand'] == null
        ? null
        : BrandModel.fromJson(json['brand'] as Map<String, dynamic>),
    color: json['color'] == null
        ? null
        : ColorModel.fromJson(json['color'] as Map<String, dynamic>),
    carFeatures: (json['car_features'] as List<dynamic>?)
        ?.map((e) => CarFeature.fromMap(e as Map<String, dynamic>))
        .toList(),
    seatingCapacity: json['seating_capacity'] as String?,
    location: json['location'] == null
        ? null
        : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
    averageRate: json['average_rate'] as int?,
    isForRent: json['is_for_rent'] as bool?,
    dailyRent: json['daily_rent'] as String?,
    weeklyRent: json['weekly_rent'] as String?,
    monthlyRent: json['monthly_rent'] as String?,
    yearlyRent: json['yearly_rent'] as String?,
    isForPay: json['is_for_pay'] as bool?,
    price: json['price'] as dynamic,
    availableToBook: json['available_to_book'] as bool?,
    reviews: (json['reviews'] as List<dynamic>?)
        ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    reviewsCount: json['reviews_count'] as int?,
    reviewsAvg: (json['reviews_avg'] as num?)?.toDouble(),
  );

  factory CarModel.placeholder() => const CarModel();
}
