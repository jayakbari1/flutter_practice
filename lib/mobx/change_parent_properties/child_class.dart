import 'package:flutter/material.dart';
import 'package:practical_5/mobx/change_parent_properties/parent_class.dart';
import 'package:practical_5/mobx/change_parent_properties/store/child_class_store.dart';
import 'package:practical_5/mobx/change_parent_properties/sub_child.dart';
import 'package:provider/provider.dart';

class ChildClass extends StatelessWidget {
  const ChildClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readStore = context.read<ChildClassStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Child Class'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => SubChildClass(
                      index: index,
                    ),
                  ),
                ),
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.network(readStore.images[index]),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ParentClass(index: index),
            ],
          );
        },
        itemCount: 5,
      ),
    );
  }
}
