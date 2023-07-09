import 'package:flutter/material.dart';
import 'package:practical_5/extension/provider_extension.dart';
import 'package:practical_5/network/store/http/dio_store.dart';

import 'dio_get.dart';
import 'dio_patch.dart';
import 'dio_post.dart';

class DioMethods extends StatelessWidget {
  const DioMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio Methods'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DioGetMethod().withProvider(DioStore()),
                ),
              ),
              child: const Text('Get'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const DioPostMethod().withProvider(DioStore()),
                ),
              ),
              child: const Text('Post'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DioPatchMethod(
                    index: 0,
                  ).withProvider(DioStore()),
                ),
              ),
              child: const Text('Patch'),
            ),
          ],
        ),
      ),
    );
  }
}
