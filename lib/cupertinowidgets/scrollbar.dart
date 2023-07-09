import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollbarWidget extends StatelessWidget {
  const ScrollbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Scrollbar Widget'),
        //leading:
      ),
      child: Scrollbar(
        trackVisibility: true,
        thickness: 5,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                margin: const EdgeInsets.all(20),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('Index is $index'),
              ),
            );
          },
          itemCount: 100,
        ),
      ),
    );
  }
}
