import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/model/source.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "description")
  String description;

  @JsonKey(name: "content")
  String content;

  @JsonKey(name: "url")
  String url;

  @JsonKey(name: "image")
  String image;

  @JsonKey(name: "publishedAt")
  DateTime publishedAt;

  @JsonKey(name: "lang")
  String lang;

  @JsonKey(name: "source")
  Source source;

  Article({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.url,
    required this.image,
    required this.publishedAt,
    required this.lang,
    required this.source,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
