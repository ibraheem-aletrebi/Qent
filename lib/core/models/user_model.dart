import 'package:quent/core/models/country_model.dart';
import 'package:quent/core/models/location_model.dart';

class UserModel {
  final int id;
  final String fullName;
  final String email;
  final String phone;
  final bool phoneIsVerified;
  final CountryModel country;
  final LocationModel location;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.phoneIsVerified,
    required this.country,
    required this.location,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      phoneIsVerified: json['phone_is_verified'] ?? false,
      country: CountryModel.fromJson(json['country'] ?? {}),
      location: LocationModel.fromJson(json['location'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'phone_is_verified': phoneIsVerified,
      'country': country.toJson(),
      'location': location.toJson(),
    };
  }
}
