// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticlesResponse _$ArticlesResponseFromJson(Map<String, dynamic> json) =>
    ArticlesResponse(
      totalArticles: (json['totalArticles'] as num).toInt(),
      articles: (json['articles'] as List<dynamic>)
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticlesResponseToJson(ArticlesResponse instance) =>
    <String, dynamic>{
      'totalArticles': instance.totalArticles,
      'articles': instance.articles,
    };
