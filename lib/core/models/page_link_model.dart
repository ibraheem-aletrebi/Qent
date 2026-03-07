class PageLinkModel {
  final String? url;
  final String label;
  final bool active;

  PageLinkModel({this.url, required this.label, required this.active});

  factory PageLinkModel.fromJson(Map<String, dynamic> json) {
    return PageLinkModel(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
