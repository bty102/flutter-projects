import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

@JsonSerializable()
class Source {
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "url")
  String url;

  @JsonKey(name: "country")
  String country;

  Source({
    required this.id,
    required this.name,
    required this.url,
    required this.country,
  });

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
