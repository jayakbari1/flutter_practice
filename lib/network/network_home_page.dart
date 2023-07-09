import 'package:flutter/material.dart';
import 'package:practical_5/route/routes.dart';

import 'http/http_methods.dart';

class NetworkHomePage extends StatelessWidget {
  const NetworkHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    maintainState: false,
                    fullscreenDialog: true,
                    builder: (_) => const HttpMethods(),
                  ));
                  //  Navigator.pushNamed(context, Routes.httpPage);
                },
                child: const Text('HTTP')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.dioPage);
                },
                child: const Text('Dio')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.tmdbPage);
                },
                child: const Text('TMDB'))
          ],
        ),
      ),
    );
  }
}
