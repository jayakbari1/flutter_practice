import 'package:flutter/material.dart';
import 'package:practical_5/extension/provider_extension.dart';
import 'package:practical_5/network/tmdb/http/tmdb_http.dart';
import 'package:practical_5/network/tmdb/retrofit/retrofit_page.dart';
import 'package:practical_5/network/tmdb/store/retrofit_store.dart';
import 'package:practical_5/network/tmdb/store/tmdb_dio_store.dart';

import 'Dio/tmdb_dio_page.dart';

class TMDBPage extends StatelessWidget {
  const TMDBPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB API CALL'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TMDBHttpPage(),
                ),
              ),
              child: const Text('TMDB HTTP CALL'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const TMDBDioPage().withProvider(TMDBDioStore()),
                ),
              ),
              child: const Text('TMDB DIO CALL'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const TMDBRetrofit().withProvider(RetrofitStore()),
                ),
              ),
              child: const Text('TMDB Retrofit CALL'),
            ),
          ],
        ),
      ),
    );
  }
}
