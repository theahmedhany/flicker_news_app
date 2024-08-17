import 'package:flicker_news_app/widgets/news_list_view_builder.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFEFE8),
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          leading: BackButton(color: Color(0xff637E76)),
          backgroundColor: Color(0xffF8DFD4),
          centerTitle: true,
          title: Text(
            category,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color(0xff637E76),
              fontFamily: 'Ojuju',
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: CustomScrollView(
              slivers: [
                NewsListViewBuilder(
                  category: category,
                )
              ],
            )));
  }
}
