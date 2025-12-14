// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  content: json['content'] as String,
  url: json['url'] as String,
  image: json['image'] as String,
  publishedAt: DateTime.parse(json['publishedAt'] as String),
  lang: json['lang'] as String,
  source: Source.fromJson(json['source'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'content': instance.content,
  'url': instance.url,
  'image': instance.image,
  'publishedAt': instance.publishedAt.toIso8601String(),
  'lang': instance.lang,
  'source': instance.source,
};
