import 'package:quent/core/models/link_model.dart';
import 'package:quent/core/models/meta_model.dart';

class BrandsResponseModel {
  final List<BrandModel> brands;
  final LinkModel link;
  final MetaModel meta;

  BrandsResponseModel({
    required this.brands,
    required this.link,
    required this.meta,
  });

  factory BrandsResponseModel.fromJson(Map<String, dynamic> json) =>
      BrandsResponseModel(
        brands: List<BrandModel>.from(
          json['data'].map((x) => BrandModel.fromJson(x)),
        ),
        link: LinkModel.fromJson(json['links']),
        meta: MetaModel.fromJson(json['meta']),
      );
}

class BrandModel {
  final int id;
  final String name;
  final String imageUrl;

  BrandModel({required this.id, required this.name, required this.imageUrl});

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      BrandModel(id: json['id'], name: json['name'], imageUrl: json['image']);
}
