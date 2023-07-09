import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'all_provider.dart';
import 'burger_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Burger>(
          create: (_) => Burger(),
        ),
        ChangeNotifierProvider<Pizza>(
          create: (_) => Pizza(),
        ),
        ChangeNotifierProxyProvider2<Burger, Pizza, Bill>(
          create: (BuildContext context) => Bill(
            Provider.of<Burger>(context, listen: false),
            Provider.of<Pizza>(context, listen: false),
          ),
          update: (context, burger, pizza, previous) => Bill(burger, pizza),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const BurgerScreen(),
    );
  }
}
