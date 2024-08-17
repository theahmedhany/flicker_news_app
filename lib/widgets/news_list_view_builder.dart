import 'package:dio/dio.dart';
import 'package:flicker_news_app/models/article_model.dart';
import 'package:flicker_news_app/services/circular_indicator.dart';
import 'package:flicker_news_app/services/news_service.dart';
import 'package:flicker_news_app/widgets/news_list_view.dart';
import 'package:flutter/material.dart';

class NewsListViewBuilder extends StatefulWidget {
  final String category;

  const NewsListViewBuilder({super.key, required this.category});

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;

  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child:
                Center(child: Text("OOPS There Was An Error Try Again Later.")),
          );
        } else {
          return const SliverFillRemaining(
            child: Center(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 80),
              child: CircularIndicator(),
            )),
          );
        }
      },
    );
  }
}
