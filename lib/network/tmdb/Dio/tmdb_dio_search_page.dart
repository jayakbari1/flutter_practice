import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:practical_5/network/tmdb/store/tmdb_dio_store.dart';
import 'package:provider/provider.dart';

class DioSearchMovies extends StatelessWidget {
  const DioSearchMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readStore = context.read<TMDBDioStore>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('SEARCH YOUR MOVIES'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: readStore.searchQuery,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search Your Favourite Movies'),
              onChanged: (query) async {
                readStore.dioSearchResult = await readStore
                    .searchMovies(query)
                    .then((value) => readStore.dioSearchResult);
              },
            ),
            Observer(builder: (context) {
              return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            height: 200,
                            color: Colors.black,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Image.network(
                                  height: 150,
                                  width: 200,
                                  'https://image.tmdb.org/t/p/original${readStore.dioSearchResult[index].poster_path}',
                                  fit: BoxFit.contain,
                                )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        readStore.dioSearchResult[index].title,
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.white),
                                        maxLines: 1,
                                      ),
                                      Text(
                                        readStore.dioSearchResult[index]
                                            .release_date,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      Text(
                                        readStore
                                            .dioSearchResult[index].overview,
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.white),
                                        maxLines: 1,
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
                      ),
                  separatorBuilder: (context, index) => const Divider(
                        color: Colors.greenAccent,
                      ),
                  itemCount: readStore.dioSearchResult.length);
            })
          ],
        ),
      ),
    );
  }
}
