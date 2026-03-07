import 'dart:convert';

class ImageModel {
  final int id;
  final String image;

  const ImageModel({required this.id, required this.image});

  factory ImageModel.fromMap(Map<String, dynamic> data) =>
      ImageModel(id: data['id'], image: data['image']);

  factory ImageModel.fromJson(String data) {
    return ImageModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
