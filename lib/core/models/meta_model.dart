import 'package:quent/core/models/page_link_model.dart';

class MetaModel {
  final int currentPage;
  final int? from;
  final int lastPage;
  final int perPage;
  final int? to;
  final int total;
  final String path;
  final List<PageLinkModel> links;

  MetaModel({
    required this.currentPage,
    this.from,
    required this.lastPage,
    required this.perPage,
    this.to,
    required this.total,
    required this.path,
    required this.links,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      currentPage: json['current_page'],
      from: json['from'],
      lastPage: json['last_page'],
      perPage: json['per_page'],
      to: json['to'],
      total: json['total'],
      path: json['path'],
      links: List<PageLinkModel>.from(
        json['links'].map((x) => PageLinkModel.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "per_page": perPage,
    "to": to,
    "total": total,
    "path": path,
    "links": links.map((x) => x.toJson()).toList(),
  };
}
