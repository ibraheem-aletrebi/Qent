import 'package:quent/core/models/link_model.dart';
import 'package:quent/core/models/meta_model.dart';

import 'car_model.dart';

class CarResponseModel {
  final List<CarModel> cars;
  final LinkModel links;
  final MetaModel meta;

  const CarResponseModel({
    required this.cars,
    required this.links,
    required this.meta,
  });

  factory CarResponseModel.fromJson(Map<String, dynamic> json) {
    return CarResponseModel(
      cars: (json['data'] as List)
          .map((e) => CarModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: LinkModel.fromJson(json['links'] as Map<String, dynamic>),
      meta: MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }
}
