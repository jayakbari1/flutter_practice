import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContextMenuWidget extends StatelessWidget {
  const ContextMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Cupertino Context Menu Demo'),
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(40),
            width: double.infinity,
            child: CupertinoContextMenu(
                actions: [
                  CupertinoContextMenuAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    trailingIcon: CupertinoIcons.share,
                    child: const Text('Share'),
                  ),
                  CupertinoContextMenuAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    trailingIcon: CupertinoIcons.down_arrow,
                    isDestructiveAction: false,
                    child: const Text('Save To Gallery'),
                  ),
                  CupertinoContextMenuAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    isDestructiveAction: true,
                    trailingIcon: CupertinoIcons.delete,
                    child: const Text('Delete'),
                  )
                ],
                child: CupertinoButton(
                  color: Colors.brown,
                  onPressed: () {},
                  child: const Text('Press to Get Context Menu'),
                )),
          ),
        ));
  }
}
