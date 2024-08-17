import 'package:flicker_news_app/models/article_model.dart';
import 'package:flicker_news_app/widgets/news_tile.dart';
import 'package:flutter/material.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articles;

  const NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: articles.length,
            (context, index) {
      return GestureDetector(
        child: NewsTile(articleModel: articles[index]),
      );
    }));
  }
}
