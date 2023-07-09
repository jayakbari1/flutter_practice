import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:practical_5/network/tmdb/store/tmdb_dio_store.dart';
import 'package:provider/provider.dart';

class DioFavouriteMovieList extends StatelessWidget {
  const DioFavouriteMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readStore = context.read<TMDBDioStore>();
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Favourite Movie List'),
        ),
        body: RefreshIndicator(
          onRefresh: readStore.getFavouriteList,
          child: Observer(builder: (context) {
            return readStore.favouriteMovieList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GestureDetector(
                    child: ListView.builder(
                      itemCount: readStore.favouriteMovieList.length,
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
                                  'https://image.tmdb.org/t/p/original${readStore.favouriteMovieList[index].poster_path}',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              title: Text(
                                readStore.favouriteMovieList[index].title,
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.cyan),
                                maxLines: 1,
                              ),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  debugPrint(
                                      'Id is sent ${readStore.favouriteMovieList[index].id}');
                                  readStore.deleteFavouriteMovies(
                                      readStore.favouriteMovieList[index].id!);
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      },
                    ),
                  );
          }),
        ));
  }
}
