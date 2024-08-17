import 'package:flicker_news_app/widgets/categories_list_view.dart';
import 'package:flicker_news_app/widgets/news_list_view_builder.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFEFE8),
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Color(0xffF8DFD4),
          centerTitle: true,
          title: const Text(
            "Flicker",
            style:
                TextStyle(color: Color(0xff637E76), fontFamily: 'LuckiestGuy'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: CategoriesListView(),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 5,
                ),
              ),
              const NewsListViewBuilder(category: 'general'),
            ],
          ),
        ));
  }
}
