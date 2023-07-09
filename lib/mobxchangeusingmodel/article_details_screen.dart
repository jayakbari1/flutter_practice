import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:practical_5/mobxchangeusingmodel/article_details_store.dart';

class ArticleDetailScreen extends StatelessWidget {
  ArticleDetailScreen({Key? key}) : super(key: key);

  final dataProvide = ArticleDetailsStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Detail Scree'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: dataProvide.articleList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Observer(builder: (context) {
                  return Text(
                    dataProvide.articleList[index].value.user,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  );
                }),
                Row(
                  children: [
                    Expanded(
                      child: Observer(builder: (context) {
                        return Text(
                          dataProvide.articleList[index].value.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            // overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.network(
                          dataProvide.articleList[index].value.image),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  dataProvide.articleList[index].value.publishTime,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dataProvide.changeIt();
          debugPrint(
              'Value which is change of title is ${dataProvide.articleList[0].value.title}');
          // dataProvide.articleList[0].title =
          //     'Title change using model';
        },
        child: const Icon(Icons.change_circle_outlined),
      ),
    );
  }
}
