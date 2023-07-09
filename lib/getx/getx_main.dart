import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'get_home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const GetXHomePage(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
