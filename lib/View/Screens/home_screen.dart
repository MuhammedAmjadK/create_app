import 'package:create_app/Controller/Repositories/news_repository.dart';
import 'package:create_app/Model/article_model.dart';
import 'package:create_app/View/Screens/login_screen.dart';
import 'package:create_app/View/Widgets/home_screen_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'CREATE',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.blue,
              size: 30,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
          future: NewsRepository().fetchNews(),
          builder: (BuildContext context,
              AsyncSnapshot<List<ArticleModel>> snapshot) {
            if (snapshot.data == null) {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const NewsShimmer();
                },
              );
            } else {
              return ListView.builder(
                itemCount: articleModelList.length,
                itemBuilder: (context, index) {
                  ArticleModel? articleModel = articleModelList[index];

                  return NewsCard(
                    title: articleModel.title,
                    description: articleModel.description,
                    publishedAt: articleModel.publishedAt,
                    urlToImage: articleModel.urlToImage,
                    name: articleModel.source.name,
                  );
                },
              );
            }
          }),
    );
  }
}
