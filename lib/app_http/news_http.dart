import 'dart:convert';

import 'package:flutter_news_api/vo/article.dart';
import 'package:http/http.dart' as http;

class NewsHttp {
  //api key  관리
  static var apikeyNews = '08a697c296f3432ba6df073eb05180c8';

  static Future<List<Article>> getNewsList({required String word}) async {
    List<Article> resultList = [];

    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=$word&from=2023-08-06&sortBy=popularity&apiKey=$apikeyNews'));

    var json = jsonDecode(response.body);

//큰덩어리
    var articlelist = json['articles'];

    for (var i = 0; i < articlelist.length; i++) {
      var article = articlelist[i];

      Article at = Article.fromJson(article);
      resultList.add(at);
    }
    return resultList;
  }
}
