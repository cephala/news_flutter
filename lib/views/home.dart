import 'package:flutter/material.dart';
import 'package:news_flutter/components/article_tile.dart';
import 'package:news_flutter/helper/data_category.dart';
import 'package:news_flutter/helper/news.dart';
import 'package:news_flutter/model/article_model.dart';
import 'package:news_flutter/model/category_model.dart';

import 'package:news_flutter/views/category.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  bool isLoading = true;

  void getNews() async {
    News news = News();
    await news.getNews();
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
                    // Categories
                    Container(
                      height: 60,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              imageUrl: categories[index].imageUrl,
                              categoryName: categories[index].categoryName,
                            );
                          }),
                    ),
                    // News
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

class CategoryTile extends StatelessWidget {
  final categoryName;
  final imageUrl;

  CategoryTile({required this.imageUrl, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Category(category: categoryName.toLowerCase())));
      },
      child: Container(
          margin: EdgeInsets.only(right: 16),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  imageUrl,
                  width: 120,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(6)),
                child: Text(
                  categoryName,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              )
            ],
          )),
    );
  }
}
