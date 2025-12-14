import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/model/article.dart';

part 'articles_response.g.dart';

@JsonSerializable()
class ArticlesResponse {
  @JsonKey(name: "totalArticles")
  int totalArticles;

  @JsonKey(name: "articles")
  List<Article> articles;

  ArticlesResponse({required this.totalArticles, required this.articles});

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticlesResponseFromJson(json);
}
