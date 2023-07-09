import 'package:flutter/material.dart';
import 'package:practical_5/network/tmdb/store/retrofit_api_service.dart';
import 'package:practical_5/network/tmdb/store/retrofit_store.dart';
import 'package:provider/provider.dart';

class RetrofitDetailScreen extends StatelessWidget {
  final TMDBRetrofitModel tmdbModel;

  const RetrofitDetailScreen({
    Key? key,
    required this.tmdbModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readStore = context.read<RetrofitStore>();
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: Text(tmdbModel.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 450,
              width: double.infinity,
              child: Image.network(
                'https://image.tmdb.org/t/p/original${tmdbModel.poster_path}',
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Movie Name :: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                        fontSize: 20),
                  ),
                  TextSpan(
                    text: tmdbModel.title,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Release Data :: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                        fontSize: 20),
                  ),
                  TextSpan(
                    text: tmdbModel.release_date,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'StoryLine :: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                        fontSize: 20),
                  ),
                  TextSpan(
                    text: tmdbModel.overview,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                onPressed: () {
                  // debugPrint(
                  //     '${readStore.dioMockDataResult[index].title} will be added in favourite List');
                  readStore.favouriteMovie(tmdbModel);
                },
                icon: const Icon(Icons.favorite_border),
                label: const Text('Add To Favourite'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
