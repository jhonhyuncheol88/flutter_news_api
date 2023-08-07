import 'dart:convert';

class Article {
  String id;
  String name;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;
  String publishedAt;

  Article(
      {this.id = '',
      this.name = '',
      this.author = '',
      this.title = '',
      this.description = '',
      this.url = '',
      this.urlToImage = '',
      this.publishedAt = '',
      this.content = ''});

  factory Article.fromJson(Map<String, dynamic> map) {
    return Article(
      //source 안에 id 값이 있다 라는 코드
      id: map['source']['id'] ?? '',
      name: map['source']['name'] ?? '',
      author: map['author'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
      publishedAt: map['publishedAt'] ?? '',
      content: map['content'] ?? '',
    );
  }
}
