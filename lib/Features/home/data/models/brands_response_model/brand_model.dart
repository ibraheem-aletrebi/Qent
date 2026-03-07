class BrandModel {
  final int id;
  final String name;
  final String image;

  const BrandModel({required this.id, required this.name, required this.image});

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      BrandModel(id: json['id'], name: json['name'], image: json['image']);
}
