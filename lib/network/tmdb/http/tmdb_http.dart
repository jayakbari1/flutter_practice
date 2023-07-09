import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:practical_5/network/tmdb/http/save_movies.dart';
import 'package:practical_5/network/tmdb/http/search_movies.dart';
import 'package:practical_5/network/tmdb/store/tmdb_http_store.dart';
import 'package:provider/provider.dart';

import 'details_screen.dart';

class TMDBHttpPage extends StatelessWidget {
  const TMDBHttpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readStore = context.read<TMDBHttpStore>();
    return Scaffold(
        backgroundColor: Colors.black38,
        appBar: AppBar(
          title: const Text('TMDB CALL USING HTTP'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SaveMovies(),
                  ),
                );
              },
              icon: const Icon(
                Icons.book_outlined,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SearchMovies(),
                  ),
                );
              },
              icon: const Icon(
                Icons.search_outlined,
              ),
            ),
          ],
        ),
        // body: Observer(builder: (context) {
        //   return readStore.result.isEmpty
        //       ? const Center(
        //           child: CircularProgressIndicator(),
        //         )
        //       : GestureDetector(
        //           child: ListView.builder(
        //             itemCount: readStore.result.length,
        //             itemBuilder: (context, index) {
        //               return Column(
        //                 children: [
        //                   Container(
        //                     margin: const EdgeInsets.all(10),
        //                     height: 200,
        //                     color: Colors.black,
        //                     child: Row(
        //                       children: [
        //                         Image.network(
        //                           // height: 150,
        //                           // width: 200,
        //                           'https://image.tmdb.org/t/p/original${readStore.result[index].poster_path}',
        //                           fit: BoxFit.cover,
        //                         ),
        //                         const SizedBox(
        //                           width: 10,
        //                         ),
        //                         Expanded(
        //                           child: Column(
        //                             crossAxisAlignment:
        //                                 CrossAxisAlignment.start,
        //                             children: [
        //                               Text(
        //                                 readStore.result[index].title,
        //                                 style: const TextStyle(
        //                                     overflow: TextOverflow.ellipsis,
        //                                     color: Colors.white),
        //                                 maxLines: 1,
        //                               ),
        //                               Text(
        //                                 readStore.result[index].release_date,
        //                                 style: const TextStyle(
        //                                     color: Colors.white),
        //                               ),
        //                               Text(readStore.result[index].overview,
        //                                   style: const TextStyle(
        //                                       overflow: TextOverflow.ellipsis,
        //                                       color: Colors.white),
        //                                   maxLines: 1),
        //                               ElevatedButton(
        //                                 style: ElevatedButton.styleFrom(
        //                                     backgroundColor: Colors.teal),
        //                                 onPressed: () {
        //                                   readStore.addNewMovies(
        //                                       readStore.result[index]);
        //                                   Navigator.push(
        //                                     context,
        //                                     MaterialPageRoute(
        //                                       builder: (_) => TMDBDetailsScreen(
        //                                         movieName: readStore
        //                                             .result[index].title,
        //                                         image: readStore
        //                                             .result[index].poster_path,
        //                                         releaseData: readStore
        //                                             .result[index].release_date,
        //                                         overview: readStore
        //                                             .result[index].overview,
        //                                       ),
        //                                     ),
        //                                   );
        //                                 },
        //                                 child: const Text('View Details'),
        //                               ),
        //                             ],
        //                           ),
        //                         ),
        //                         Align(
        //                           alignment: Alignment.topCenter,
        //                           child: IconButton(
        //                             onPressed: () {
        //                               print(readStore.result[index].title);
        //                               // readStore.addToFavouriteMovie(
        //                               //     readStore.result[index]);
        //                               readStore.favouriteMovie(
        //                                 readStore.result[index],
        //                               );
        //                             },
        //                             icon: Observer(
        //                               builder: (context) =>
        //                                   readStore.favouriteOrNot(
        //                                           readStore.result[index].title)
        //                                       ? const Icon(
        //                                           Icons.bookmark_add,
        //                                           color: Colors.green,
        //                                         )
        //                                       : const Icon(
        //                                           Icons.bookmark_add_outlined,
        //                                           color: Colors.green,
        //                                         ),
        //                             ),
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                   const SizedBox(
        //                     height: 15,
        //                   ),
        //                 ],
        //               );
        //             },
        //           ),
        //         );
        // }));
        body: Observer(builder: (context) {
          return readStore.mockDataResult.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GestureDetector(
                  child: ListView.builder(
                    itemCount: readStore.mockDataResult.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            height: 200,
                            color: Colors.black,
                            child: Row(
                              children: [
                                Image.network(
                                  // height: 150,
                                  // width: 200,
                                  'https://image.tmdb.org/t/p/original${readStore.mockDataResult[index].poster_path}',
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        readStore.mockDataResult[index].title,
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.white),
                                        maxLines: 1,
                                      ),
                                      Text(
                                        readStore
                                            .mockDataResult[index].release_date,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      Text(
                                          readStore
                                              .mockDataResult[index].overview,
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.white),
                                          maxLines: 1),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.teal),
                                        onPressed: () {
                                          // readStore.addNewMovies(
                                          //     readStore.mockDataResult[index]);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => TMDBDetailsScreen(
                                                movieName: readStore
                                                    .mockDataResult[index]
                                                    .title,
                                                image: readStore
                                                    .mockDataResult[index]
                                                    .poster_path,
                                                releaseData: readStore
                                                    .mockDataResult[index]
                                                    .release_date,
                                                overview: readStore
                                                    .mockDataResult[index]
                                                    .overview,
                                              ),
                                            ),
                                          );
                                        },
                                        child: const Text('View Details'),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.teal),
                                        onPressed: () async {
                                          readStore.favouriteMovie(
                                              readStore.mockDataResult[index],
                                              readStore
                                                  .mockDataResult[index].id!);
                                        },
                                        child: Observer(builder: (context) {
                                          return Text(!readStore.favouriteOrNot(
                                                  readStore
                                                      .mockDataResult[index]
                                                      .title)
                                              ? 'Add to Favourite List'
                                              : 'Already Added');
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      );
                    },
                  ),
                );
        }));
  }
}
