import 'package:flutter/material.dart';

import 'home_landscap.dart';
import 'home_potrait.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          print(MediaQuery.of(context).orientation);
          print(MediaQuery.of(context).size.height);
          print(MediaQuery.of(context).size.width);
          return MediaQuery.of(context).orientation == Orientation.portrait
              ? const HomePortraitWidget()
              : const HomeLandscapeWidget();
        },
      ),
    );
  }
}
