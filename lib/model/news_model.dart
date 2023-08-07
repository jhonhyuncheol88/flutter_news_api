import 'package:flutter/material.dart';
import 'package:flutter_news_api/app_http/news_http.dart';
import 'package:flutter_news_api/vo/article.dart';

class NewsModel extends ChangeNotifier {
  List<Article> articles = [];

//기사를 불러오는 함수
  void loadArticles({required String searchword}) async {
    articles = await NewsHttp.getNewsList(word: searchword);

    notifyListeners();
  }
}
