import 'package:quent/core/models/country_model.dart';
import 'package:quent/core/models/link_model.dart';
import 'package:quent/core/models/meta_model.dart';

class CountryResponseModel {
  final List<CountryModel> data;
  final LinkModel links;
  final MetaModel meta;

  CountryResponseModel({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory CountryResponseModel.fromJson(Map<String, dynamic> json) {
    return CountryResponseModel(
      data: List<CountryModel>.from(
        json['data'].map((x) => CountryModel.fromJson(x)),
      ),
      links: LinkModel.fromJson(json['links']),
      meta: MetaModel.fromJson(json['meta']),
    );
  }
}
