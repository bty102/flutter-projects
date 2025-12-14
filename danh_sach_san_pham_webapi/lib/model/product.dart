import 'package:danh_sach_san_pham_webapi/model/rating.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'category')
  String category;

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'rating')
  Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  int get getId => id;
  String get getTitle => title;
  double get getPrice => price;
  String get getDescription => description;
  String get getCategory => category;
  String get getImage => image;
  Rating get getRating => rating;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
