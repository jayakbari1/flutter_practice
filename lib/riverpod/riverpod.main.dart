import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practical_5/riverpod/riverpod_common_page.dart';

void main() => runApp(
      const ProviderScope(
        // observers: [CounterProviderObserver()],
        child: RiverPodApp(),
      ),
    );

class RiverPodApp extends StatelessWidget {
  const RiverPodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const RiverPodCommonPage(),
    );
  }
}
