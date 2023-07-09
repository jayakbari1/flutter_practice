import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:practical_5/extension/provider_extension.dart';
import 'package:practical_5/network/tmdb/Dio/tmdb_dio_favourite_movies.dart';
import 'package:practical_5/network/tmdb/Dio/tmdb_dio_search_page.dart';
import 'package:provider/provider.dart';

import '../store/tmdb_dio_store.dart';
import 'tmdb_dio_detail_screen.dart';

class TMDBDioPage extends StatelessWidget {
  const TMDBDioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readStore = context.read<TMDBDioStore>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('TMDB DIO Request'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const DioSearchMovies().withProvider(TMDBDioStore()),
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
                  builder: (_) => const DioFavouriteMovieList()
                      .withProvider(TMDBDioStore()),
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
          if (readStore.appState == NetworkState.initial) {
            return const Center(
              child: Text('App is in Initialization'),
            );
          } else if (readStore.appState == NetworkState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (readStore.appState == NetworkState.success) {
            return GestureDetector(
              child: ListView.builder(
                itemCount: readStore.dioMockDataResult.length,
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
                              'https://image.tmdb.org/t/p/original${readStore.dioMockDataResult[index].poster_path}',
                              fit: BoxFit.fill,
                            ),
                          ),
                          title: Text(
                            readStore.dioMockDataResult[index].title,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.cyan),
                            maxLines: 1,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TMDBDioDetailScreen(
                                  index: index,
                                  movieName:
                                      readStore.dioMockDataResult[index].title,
                                  image: readStore
                                      .dioMockDataResult[index].poster_path,
                                  releaseData: readStore
                                      .dioMockDataResult[index].release_date,
                                  overview: readStore
                                      .dioMockDataResult[index].overview,
                                ).withProvider(TMDBDioStore()),
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
          } else {
            debugPrint('In Else Part');
            return Center(
              child: ElevatedButton(
                  onPressed: () {
                    readStore.dioGetMockData();
                  },
                  child: const Text('Retry')),
            );
          }
          // body: Observer(
          //   builder: (context) {
          //     return readStore.appState == NetworkState.loading
          //         ? const Center(
          //             child: CircularProgressIndicator(),
          //           )
          //         : GestureDetector(
          //             child: ListView.builder(
          //               itemCount: readStore.dioMockDataResult.length,
          //               itemBuilder: (context, index) {
          //                 return Column(
          //                   children: [
          //                     ListTile(
          //                         leading: SizedBox(
          //                           height: 100,
          //                           width: 100,
          //                           child: Image.network(
          //                             // height: 150,
          //                             // width: 200,
          //                             'https://image.tmdb.org/t/p/original${readStore.dioMockDataResult[index].poster_path}',
          //                             fit: BoxFit.fill,
          //                           ),
          //                         ),
          //                         title: Text(
          //                           readStore.dioMockDataResult[index].title,
          //                           style: const TextStyle(
          //                               overflow: TextOverflow.ellipsis,
          //                               color: Colors.cyan),
          //                           maxLines: 1,
          //                         ),
          //                         onTap: () {
          //                           Navigator.push(
          //                             context,
          //                             MaterialPageRoute(
          //                               builder: (_) => TMDBDioDetailScreen(
          //                                 index: index,
          //                                 movieName: readStore
          //                                     .dioMockDataResult[index].title,
          //                                 image: readStore
          //                                     .dioMockDataResult[index].poster_path,
          //                                 releaseData: readStore
          //                                     .dioMockDataResult[index]
          //                                     .release_date,
          //                                 overview: readStore
          //                                     .dioMockDataResult[index].overview,
          //                               ).withProvider(TMDBDioStore()),
          //                             ),
          //                           );
          //                         },
          //                         trailing: const Icon(
          //                           Icons.arrow_circle_right,
          //                           color: Colors.white,
          //                         )),
          //                     const SizedBox(
          //                       height: 10,
          //                     ),
          //                   ],
          //                 );
          //               },
          //             ),
          //           );
          //   },
          // ),
        },
      ),
    );
  }
}
