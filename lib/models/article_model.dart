class ArticleModel {
  final String? image;
  final String title;
  final String? description;
  final String url;

  ArticleModel({
    required this.image,
    required this.title,
    required this.description,
    required this.url,
  });

  factory ArticleModel.fromJson(json) {
    return ArticleModel(
      image: json['urlToImage'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
    );
  }
}
