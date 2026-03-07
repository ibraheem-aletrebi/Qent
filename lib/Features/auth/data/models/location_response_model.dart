import 'package:quent/core/models/link_model.dart';
import 'package:quent/core/models/location_model.dart';
import 'package:quent/core/models/meta_model.dart';

class LocationResponseModel {
  final List<LocationModel> data;
  final LinkModel links;
  final MetaModel meta;
  LocationResponseModel({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory LocationResponseModel.fromJson(Map<String, dynamic> json) {
    return LocationResponseModel(
      data: List<LocationModel>.from(
        json['data'].map((x) => LocationModel.fromJson(x)),
      ),
      links: LinkModel.fromJson(json['links']),
      meta: MetaModel.fromJson(json['meta']),
    );
  }
}
