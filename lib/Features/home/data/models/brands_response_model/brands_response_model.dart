import 'package:quent/Features/home/data/models/brands_response_model/brand_model.dart';
import 'package:quent/core/models/link_model.dart';
import 'package:quent/core/models/meta_model.dart';

class BrandsResponseModel {
  final List<BrandModel> brands;
  final LinkModel links;
  final MetaModel meta;

  const BrandsResponseModel({
    required this.brands,
    required this.links,
    required this.meta,
  });

  factory BrandsResponseModel.fromJson(Map<String, dynamic> data) {
    return BrandsResponseModel(
      brands: (data['data'] as List)
          .map((e) => BrandModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: LinkModel.fromJson(data['links'] as Map<String, dynamic>),
      meta: MetaModel.fromJson(data['meta'] as Map<String, dynamic>),
    );
  }
}