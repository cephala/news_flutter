import 'package:flutter/material.dart';
import 'package:news_flutter/views/article_detail.dart';

class ArticleTile extends StatelessWidget {
  final imageUrl, title, desc, author, url, content;
  ArticleTile(
      {required this.imageUrl,
      required this.title,
      required this.desc,
      required this.author,
      required this.url,
      required this.content});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ArticleDetail(articleUrl: url, content: content,)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 110,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(imageUrl), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(3)),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        desc,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text('By',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 10)),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            author,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
