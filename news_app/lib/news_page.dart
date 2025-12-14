import 'package:flutter/material.dart';
import 'package:news_app/api.dart';
import 'package:news_app/article_item.dart';
import 'package:news_app/model/article.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late API api;
  late String key;
  late int page;
  late int pageSize;
  late Future<List<Article>?> articles;

  @override
  void initState() {
    api = API();
    key = "code";
    page = 3;
    pageSize = 5;
    articles = api.getArticles(key, page, pageSize);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }

  Widget myBody() {
    return Column(
      children: [
        header(),
        FutureBuilder(
          future: articles,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              if (snapshot.data == null) {
                return Center(child: Text("Error"));
              }
              return renderArticleList(snapshot.data!);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }

  Widget header() {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                articles = api.getArticles(key, page, pageSize);
              });
            },
            icon: Icon(Icons.replay_outlined),
          ),
          Text(
            "DAILY NEWS",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ],
      ),
    );
  }

  // Widget renderArticle(Article article) {
  //   return Container(
  //     child: Column(
  //       children: [
  //         Image.network(article.image, height: 100),
  //         Text(article.title, style: TextStyle(fontWeight: FontWeight.bold)),
  //         Text(article.description),
  //         ElevatedButton(
  //           onPressed: () {},
  //           child: Text("view details"),
  //           style: ElevatedButton.styleFrom(),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget renderArticleList(List<Article> articles) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.52,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: articles.length,
          itemBuilder: (context, index) =>
              ArticleItem(article: articles[index]),
        ),
      ),
    );
  }
}
