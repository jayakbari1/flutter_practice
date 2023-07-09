import 'package:flutter/material.dart';
import 'package:practical_5/mobx/change_parent_properties/store/parent_class_store.dart';
import 'package:provider/provider.dart';

class ParentClass extends StatelessWidget {
  final int index;
  const ParentClass({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readStore = context.read<ParentClassStore>();

    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () {
            readStore.postLiked(index);
            debugPrint('You like the post');
            debugPrint('isPostlike is ${readStore.isPostLike}');
          },
          label: const Text('Like Post'),
          icon: const Icon(Icons.thumb_up),
        ),
        ElevatedButton.icon(
          onPressed: () => readStore.postDisliked(index),
          label: const Text('Dislike Post'),
          icon: const Icon(Icons.thumb_down),
        ),
        ElevatedButton.icon(
          onPressed: () => readStore.postDisliked(index),
          label: const Text('Generate Report'),
          icon: const Icon(Icons.note_add_rounded),
        ),
      ],
    );
  }
}
