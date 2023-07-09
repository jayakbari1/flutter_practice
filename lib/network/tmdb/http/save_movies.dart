import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:practical_5/network/tmdb/store/tmdb_http_store.dart';
import 'package:provider/provider.dart';

class SaveMovies extends StatelessWidget {
  const SaveMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readStore = context.read<TMDBHttpStore>();
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: Text('SAVED MOVIES'),
      ),
      body: RefreshIndicator(
        onRefresh: readStore.getFavouriteList,
        child: Observer(builder: (context) {
          return readStore.favouriteMovieList.isEmpty
              ? Center(
                  child: ListView(
                    children: const [
                      Text(
                        'There is no any favourite movie',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: readStore.favouriteMovieList.length,
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
                                'https://image.tmdb.org/t/p/original${readStore.favouriteMovieList[index].poster_path}',
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      readStore.favouriteMovieList[index].title,
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.white),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      readStore.favouriteMovieList[index]
                                          .release_date,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                        readStore
                                            .favouriteMovieList[index].overview,
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.white),
                                        maxLines: 1),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red),
                                      onPressed: () {
                                        debugPrint(
                                            'Id is sent ${readStore.favouriteMovieList[index].id}');
                                        readStore.deleteFavouriteMovies(
                                            readStore
                                                .favouriteMovieList[index].id!);
                                      },
                                      child: const Text('Unsubscribe'),
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
                );
        }),
      ),
    );
  }
}
