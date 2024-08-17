import 'package:flicker_news_app/models/article_model.dart';
import 'package:flicker_news_app/views/details_view.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});

  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailsView(
            article: articleModel,
            controller: WebViewController(),
          );
        }));
      },
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xffDDBEA9), width: 2),
                color: Color(0xffF8DFD4),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: const Color(0xffDDBEA9),
                      borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: articleModel.image != null
                        ? Image.network(
                            articleModel.image!,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "assets/Oops.jpg",
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              );
                            },
                          )
                        : Image.asset(
                            "assets/Oops.jpg",
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  articleModel.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xffC69774),
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  articleModel.description ?? "",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xff637E76),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
