import 'package:flutter/material.dart';
import 'package:practical_5/Hero/page2.dart';

class HeroPage1 extends StatelessWidget {
  const HeroPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation'),
      ),
      body: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  fullscreenDialog: true,
                  transitionDuration: const Duration(seconds: 5),
                  pageBuilder: (_, __, ___) => const HeroPage2(),
                ),
              );
            },
            child: Hero(
              tag: 'Hero',
              transitionOnUserGestures: true,
              flightShuttleBuilder: (flightContext, animation, flightDirection,
                  fromHeroContext, toHeroContext) {
                if (flightDirection == HeroFlightDirection.push) {
                  return const Icon(Icons.push_pin);
                } else {
                  return const Icon(Icons.remove);
                }
              },
              child: const Icon(
                Icons.add_circle,
                size: 100,
              ),
            ),
          ),
          const Icon(
            Icons.remember_me,
            size: 100,
          ),
        ],
      ),
    );
  }
}
