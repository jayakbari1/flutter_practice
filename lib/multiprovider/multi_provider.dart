import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Counter()),
      ChangeNotifierProvider(create: (_) => Clock())
    ],
    child: const MyApp(),
  ));
}

class Counter extends ChangeNotifier {
  Counter() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _count++;
      notifyListeners();
    });
  }
  int _count = 42;
  int get count => _count;
}

class Clock extends ChangeNotifier {
  Clock() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      //_dateTime = DateTime.now();
      newCount++;
      notifyListeners();
    });
  }

  int newCount = 0;

  int get getNewCount => newCount;

  DateTime _dateTime = DateTime.now();
  DateTime get dateTime => _dateTime;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dateTime = context.watch<Clock>().dateTime;
    final newDateCount = context.watch<Clock>().getNewCount;
    final count = context.watch<Counter>().count;
    return Center(
      child: RichText(
        text: TextSpan(text: '$dateTime\n$count\n$newDateCount'),
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
