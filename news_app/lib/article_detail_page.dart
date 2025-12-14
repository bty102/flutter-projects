import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';

class ArticleDetailPage extends StatefulWidget {
  final Article article;
  const ArticleDetailPage({super.key, required this.article});

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody(context));
  }

  Widget myBody(BuildContext context) {
    return Column(
      children: [
        myHeader(context),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: ListView(
              children: [
                Text(
                  widget.article.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.article.publishedAt.toString(),
                  style: TextStyle(color: Colors.grey),
                ),
                Text(widget.article.description),
                Image.network(widget.article.image),
                Text(widget.article.content),
                Text(
                  "Source: ${widget.article.source.name} - ${widget.article.source.country}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget myHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_backspace_sharp),
          ),
        ],
      ),
    );
  }
}
