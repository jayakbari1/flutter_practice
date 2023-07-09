import 'package:flutter/material.dart';
import 'package:practical_5/extension/provider_extension.dart';
import 'package:practical_5/network/http/http_get.dart';

import '../store/http/http_store.dart';
import 'http_patch.dart';
import 'http_post.dart';
import 'http_put.dart';

class HttpMethods extends StatefulWidget {
  const HttpMethods({Key? key}) : super(key: key);

  @override
  State<HttpMethods> createState() => _HttpMethodsState();
}

class _HttpMethodsState extends State<HttpMethods> {
  @override
  void dispose() {
    debugPrint('Dispose is called');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const HttpGetMethod().withProvider(HttpStore()),
                ),
              ),
              child: const Text('Get'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      HttpPostMethod().withProvider(HttpStore()),
                ),
              ),
              child: const Text('Post'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const HttpPutMethod().withProvider(HttpStore()),
                ),
              ),
              child: const Text('Patch'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HttpPatchMethod(
                    index: 0,
                  ).withProvider(HttpStore()),
                ),
              ),
              child: const Text('Put'),
            ),
          ],
        ),
      ),
    );
  }
}
