import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/app_http/news_http.dart';
import 'package:flutter_news_api/model/news_model.dart';
import 'package:flutter_news_api/vo/article.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<NewsModel>(context, listen: false)
        .loadArticles(searchword: "book");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('뉴스 '),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Consumer<NewsModel>(
            builder: (context, newsmodel, child) {
              return SingleChildScrollView(
                child: Column(
                  children: newsmodel.articles
                      .map((e) => buildNewsBox2(article: e))
                      .toList(),
                ),
              );
            },
          )),
    );
  }
}

Widget buildNewsBox({required Article article}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    margin: EdgeInsets.only(bottom: 50),
    child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          article.urlToImage != ''
              ? Image.network(
                  article.urlToImage,
                  width: 80,
                  height: 100,
                  fit: BoxFit.cover,
                )
              : Text('no image'),
        ],
      ),
      Row(
        children: [
          Text(
            article.id,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
      Text(article.name, textAlign: TextAlign.left),
      Text(article.title, textAlign: TextAlign.left),
    ]),
  );
}

Widget buildNewsBox2({required Article article}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    margin: EdgeInsets.only(bottom: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        article.urlToImage != ''
            ? ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  article.urlToImage,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ))
            : const Text('No Image'),
        const SizedBox(
          height: 10,
        ),
        Text(
          article.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'by ${article.author}',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          article.content,
          style: const TextStyle(color: Colors.black54),
        ),
      ],
    ),
  );
}
