import 'package:dio/dio.dart';
import 'package:news_app/config/api_config.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/model/articles_response.dart';

class API {
  Future<List<Article>?> getArticles(String key, int page, int pageSize) async {
    List<Article>? lst = null;
    Dio dio = Dio();
    String url =
        "https://gnews.io/api/v4/search?q=${key}&page=${page}&max=${pageSize}&lang=en&apikey=${APIConfig.API_KEY}";
    var response = await dio.request(url, options: Options(method: 'GET'));
    if (response.statusCode == 200) {
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
      lst = articlesResponse.articles;
    }
    return lst;
  }
}
