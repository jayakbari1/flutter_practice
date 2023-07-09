import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:practical_5/network/tmdb/store/retrofit_store.dart';
import 'package:provider/provider.dart';

class RetrofitSearchPage extends StatelessWidget {
  const RetrofitSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readStore = context.read<RetrofitStore>();
    print('search data : ${readStore.retrofitResponse}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Your Favourite Movies'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            readStore.retrofitGetData();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
                controller: readStore.searchController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Search Your Favourite Movies'),
                onSubmitted: (query) => readStore.retrofitSearchData(query)),
            Observer(builder: (_) {
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
                                  'https://image.tmdb.org/t/p/original${readStore.retrofitResponse[index].poster_path}',
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
                                        readStore.retrofitResponse[index].title,
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.white),
                                        maxLines: 1,
                                      ),
                                      Text(
                                        readStore.retrofitResponse[index]
                                            .release_date,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      Text(
                                        readStore
                                            .retrofitResponse[index].overview,
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
                  itemCount: readStore.retrofitResponse.length);
            })
          ],
        ),
      ),
    );
  }
}
