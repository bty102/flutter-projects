import 'package:flutter/material.dart';
import 'package:news_app/article_detail_page.dart';
import 'package:news_app/model/article.dart';

class ArticleItem extends StatelessWidget {
  final Article article;

  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return renderArticle(article, context);
  }

  Widget renderArticle(Article article, BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailPage(article: this.article),
            ),
          );
        },
        child: Column(
          children: [
            Image.network(article.image, height: 100),
            Text(article.title, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(article.description),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) =>
            //             ArticleDetailPage(article: this.article),
            //       ),
            //     );
            //   },
            //   child: Text("view details"),
            //   style: ElevatedButton.styleFrom(),
            // ),
          ],
        ),
      ),
    );
  }
}
