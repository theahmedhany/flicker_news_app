import 'package:flicker_news_app/services/splash_screen.dart';
import 'package:flicker_news_app/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  SplashScreen();
  runApp(const NewsApp());
}

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<StatefulWidget> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
