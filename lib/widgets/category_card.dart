import 'package:flicker_news_app/models/category_model.dart';
import 'package:flicker_news_app/views/category_view.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.Category});

  final CategoryModel Category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CategoryView(
            category: Category.categoryName,
          );
        }));
      },
      child: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 13),
        margin: const EdgeInsets.only(right: 15),
        width: 240,
        height: 140,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Category.image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          Category.categoryName,
          style: const TextStyle(
              fontFamily: 'Ojuju',
              fontSize: 22,
              color: Color(0xffF0EFEB),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
