import 'package:flutter/material.dart';

class TMDBDetailsScreen extends StatelessWidget {
  final String movieName;
  final String releaseData;
  final String image;
  final String overview;
  const TMDBDetailsScreen(
      {Key? key,
      required this.movieName,
      required this.releaseData,
      required this.image,
      required this.overview})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: Text(movieName),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 450,
            width: double.infinity,
            child: Image.network(
              'https://image.tmdb.org/t/p/original$image',
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
                  text: movieName.toString(),
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
                  text: releaseData.toString(),
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
                  text: overview.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
