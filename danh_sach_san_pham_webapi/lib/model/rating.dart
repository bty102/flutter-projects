import 'package:json_annotation/json_annotation.dart';
part 'rating.g.dart';

@JsonSerializable()
class Rating {
  @JsonKey(name: 'rate')
  double rate;

  @JsonKey(name: 'count')
  int count;

  Rating({required this.rate, required this.count});

  double get getRate => rate;
  int get getCount => count;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}
