import 'package:flutter/material.dart';
import 'package:flutter_news_api/model/news_model.dart';
import 'package:flutter_news_api/screen/news_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NewsModel())],
      child: MaterialApp(title: 'Flutter Demo', home: NewsScreen()),
    );
  }
}
