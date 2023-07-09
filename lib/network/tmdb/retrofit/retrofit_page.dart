import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:practical_5/extension/provider_extension.dart';
import 'package:practical_5/network/tmdb/retrofit/retrofit_detail_screen.dart';
import 'package:practical_5/network/tmdb/retrofit/retrofit_favourite_page.dart';
import 'package:practical_5/network/tmdb/retrofit/retrofit_search_page.dart';
import 'package:practical_5/network/tmdb/store/tmdb_dio_store.dart';
import 'package:provider/provider.dart';

import '../store/retrofit_store.dart';

class TMDBRetrofit extends StatelessWidget {
  const TMDBRetrofit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readStore = context.read<RetrofitStore>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Retrofit API Call'),
        actions: [
          IconButton(
            onPressed: () {
              readStore.retrofitResponse.clear();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const RetrofitSearchPage().withCommonProvider(readStore),
                ),
              );
            },
            icon: const Icon(
              Icons.search_outlined,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Provider.value(
                      value: RetrofitStore(),
                      child: const RetrofitFavouritePage()),
                ),
              );
            },
            icon: const Icon(
              Icons.favorite_outlined,
            ),
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          switch (readStore.networkState) {
            case NetworkState.initial:
              return const SizedBox();
            case NetworkState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case NetworkState.success:
              return GestureDetector(
                child: ListView.builder(
                  itemCount: readStore.retrofitResponse.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                            leading: SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                // height: 150,
                                // width: 200,
                                'https://image.tmdb.org/t/p/original${readStore.retrofitResponse[index].poster_path}',
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text(
                              readStore.retrofitResponse[index].title,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.cyan),
                              maxLines: 1,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => RetrofitDetailScreen(
                                          tmdbModel:
                                              readStore.retrofitResponse[index])
                                      .withProvider(RetrofitStore()),
                                ),
                              );
                            },
                            trailing: const Icon(
                              Icons.arrow_circle_right,
                              color: Colors.white,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  },
                ),
              );
            case NetworkState.failure:
              return ElevatedButton(
                  onPressed: () {}, child: const Text('Retry'));
          }
        },
      ),
    );
  }
}
