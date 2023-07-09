import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:practical_5/network/tmdb/store/retrofit_store.dart';
import 'package:provider/provider.dart';

class RetrofitFavouritePage extends StatelessWidget {
  const RetrofitFavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readStore = context.read<RetrofitStore>();
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Favourite Movie List'),
        ),
        body: RefreshIndicator(
          onRefresh: readStore.refreshFavouriteList,
          child: Observer(builder: (context) {
            return readStore.retrofitFavouriteResponse.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GestureDetector(
                    child: ListView.builder(
                      itemCount: readStore.retrofitFavouriteResponse.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: SizedBox(
                                height: 500,
                                width: 80,
                                child: Image.network(
                                  // height: 150,
                                  // width: 200,
                                  'https://image.tmdb.org/t/p/original${readStore.retrofitFavouriteResponse[index].poster_path}',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              title: Text(
                                readStore
                                    .retrofitFavouriteResponse[index].title,
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
                                      'Id is sent ${readStore.retrofitFavouriteResponse[index].id}');
                                  readStore.retrofitDeleteMovie(readStore
                                      .retrofitFavouriteResponse[index].id!);
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
