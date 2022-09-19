import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/model/error.dart';
import 'package:news_api_flutter_package/model/source.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';

class MyNewsFeed extends StatefulWidget {
  const MyNewsFeed({super.key});

  @override
  State<MyNewsFeed> createState() => _MyNewsFeedState();
}

class _MyNewsFeedState extends State<MyNewsFeed> {
  final NewsAPI _newsAPI = NewsAPI("e723e4bdbe574c8bb27baa45ef0c5673");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          color: Color.fromARGB(255, 249, 223, 162),
          child: Text('LONDON NEWS FEED', style: TextStyle(fontSize: 50)),
        ),
        Container(height: 800, child: _buildEverythingTabView()),
      ],
    )));
  }

  Widget _buildEverythingTabView() {
    return FutureBuilder<List<Article>>(
        future: _newsAPI.getEverything(query: "london"),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? snapshot.hasData
                  ? _buildArticleListView(snapshot.data!)
                  : _buildError(snapshot.error as ApiError)
              : _buildProgress();
        });
  }

  Widget _buildArticleListView(List<Article> articles) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        Article article = articles[index];
        return Card(
          child: ListTile(
            title: Text(article.title!, maxLines: 2),
            subtitle: Text(article.description ?? "", maxLines: 3),
            // trailing: article.urlToImage == null
            //     ? null
            //     : Image.network(article.urlToImage!),
          ),
        );
      },
    );
  }

  Widget _buildProgress() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildError(ApiError error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error.code ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 4),
            Text(error.message!, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
