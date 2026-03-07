class ColorModel {
  final int id;
  final String name;
  final String hexValue;

  const ColorModel({
    required this.id,
    required this.name,
    required this.hexValue,
  });

  factory ColorModel.fromJson(Map<String, dynamic> json) => ColorModel(
    id: json['id'],
    name: json['name'],
    hexValue: json['hex_value'],
  );
}
