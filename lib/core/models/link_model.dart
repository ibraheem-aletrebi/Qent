class LinkModel {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  LinkModel({this.first, this.last, this.prev, this.next});

  factory LinkModel.fromJson(Map<String, dynamic> json) {
    return LinkModel(
      first: json['first'],
      last: json['last'],
      prev: json['prev'],
      next: json['next'],
    );
  }

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}
