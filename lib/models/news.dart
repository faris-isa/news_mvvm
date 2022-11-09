import 'articles.dart';

class NewsModels {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsModels({this.status, this.totalResults, this.articles});

  NewsModels.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
  }
}