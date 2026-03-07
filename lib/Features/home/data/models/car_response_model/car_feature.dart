import 'dart:convert';

class CarFeature {
  final int id;
  final String name;
  final String value;
  final String image;

  const CarFeature({
    required this.id,
    required this.name,
    required this.value,
    required this.image,
  });

  factory CarFeature.fromMap(Map<String, dynamic> data) => CarFeature(
    id: data['id'],
    name: data['name'],
    value: data['value'],
    image: data['image'],
  );

  factory CarFeature.fromJson(String data) {
    return CarFeature.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
