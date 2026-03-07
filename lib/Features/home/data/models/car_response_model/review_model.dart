class ReviewModel {
  final int? id;
  final String? username;
  final String? review;
  final String? userImage;
  final int? rate;

  const ReviewModel({
    this.id,
    this.username,
    this.review,
    this.userImage,
    this.rate,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    id: json['id'] as int?,
    username: json['username'] as String?,
    review: json['review'] as String?,
    userImage: json['user_image'] as String?,
    rate: json['rate'] as int?,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'username': username,
    'review': review,
    'user_image': userImage,
    'rate': rate,
  };
}
