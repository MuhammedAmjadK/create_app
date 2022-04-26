import 'dart:convert';
import 'package:create_app/Model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<ArticleModel> articleModelList = [];

class NewsRepository extends ChangeNotifier {
  Future<List<ArticleModel>> fetchNews() async {
    articleModelList.clear();

    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=apple&from=2022-04-23&to=2022-04-23&sortBy=popularity&apiKey=2dc7c2ad4be64f0c8bf21de978c93291"));

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var item in data["articles"]) {
        ArticleModel _articleModel = ArticleModel.fromJson(item);
        articleModelList.add(_articleModel);
      }
      return articleModelList;
    } else {
      return articleModelList; // empty list
    }
  }
}
