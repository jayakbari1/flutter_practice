import 'package:flutter/material.dart';
import 'package:practical_5/mobx/change_parent_properties/store/child_class_store.dart';
import 'package:provider/provider.dart';

class SubChildClass extends StatelessWidget {
  final int index;
  SubChildClass({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readStore = context.read<ChildClassStore>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Child Class'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 500,
            width: 500,
            child: Image.network(readStore.images[index]),
          ),
          Text(
            readStore.isPostLike
                ? 'You Like This Post'
                : 'You Are not like this post',
          ),
          Text('Total likeCount is ${readStore.likeCount[index]}'),
          Text('Total Dislike of Class is ${readStore.dislikeCount[index]}'),
        ],
      ),
    );
  }
}
