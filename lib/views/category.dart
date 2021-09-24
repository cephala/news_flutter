import 'package:flutter/material.dart';
import 'package:news_flutter/components/article_tile.dart';
import 'package:news_flutter/helper/news.dart';
import 'package:news_flutter/model/article_model.dart';

class Category extends StatefulWidget {
  final category;

  Category({this.category});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<ArticleModel> articles = <ArticleModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  bool isLoading = true;

  void getNews() async {
    CategoryNews news = CategoryNews();
    await news.getCategoryNews(widget.category);
    articles = news.news;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(color: Colors.red),
            ),
            Text('Swen')
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: isLoading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          widget.category.toUpperCase(),
                          style: TextStyle(
                              fontSize: 18, fontStyle: FontStyle.italic),
                        )),
                    Container(
                        child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return ArticleTile(
                            imageUrl: articles[index].urlToImage,
                            title: articles[index].title,
                            author: articles[index].author,
                            url: articles[index].articleUrl,
                            content: articles[index].content,
                            desc: articles[index].description);
                      },
                    ))
                  ],
                ),
              ),
            ),
    );
  }
}
