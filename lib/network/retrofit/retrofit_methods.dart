import 'package:flutter/material.dart';
import 'package:practical_5/extension/provider_extension.dart';
import 'package:practical_5/network/retrofit/retrofit_get.dart';

import '../tmdb/store/retrofit_store.dart';

class RetrofitMethods extends StatelessWidget {
  const RetrofitMethods({Key? key}) : super(key: key);

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
                  builder: (_) =>
                      const RetrofitGet().withProvider(RetrofitStore()),
                ),
              ),
              child: const Text('Get'),
            ),
          ],
        ),
      ),
    );
  }
}
