class TokenModel {
  final String access;
  final String refresh;

  TokenModel({required this.access, required this.refresh});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(access: json['access'], refresh: json['refresh']);
  }

  Map<String, dynamic> toJson() {
    return {'access': access, 'refresh': refresh};
  }
}
