import 'package:flicker_news_app/models/category_model.dart';
import 'package:flicker_news_app/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  CategoriesListView({
    super.key,
  });

  final List<CategoryModel> categories = [
    CategoryModel(image: "assets/General_news.jpg", categoryName: "General"),
    CategoryModel(image: "assets/business.jpg", categoryName: "Business"),
    CategoryModel(
        image: "assets/entertainment.jpg", categoryName: "Entertainment"),
    CategoryModel(image: "assets/health.jpg", categoryName: "Health"),
    CategoryModel(image: "assets/science.jpg", categoryName: "Science"),
    CategoryModel(image: "assets/sports.jpg", categoryName: "Sports"),
    CategoryModel(
        image: "assets/technology_news.jpg", categoryName: "Technology"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(Category: categories[index]);
          }),
    );
  }
}
