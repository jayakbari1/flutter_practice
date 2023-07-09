import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practical_5/BLoc/BLoc_Example/bloc.dart';

import 'bloc_example_home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BLocExample()..add(LoadingImageEvent()),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
