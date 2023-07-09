import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:practical_5/network/tmdb/model/tmdb_model.dart';

import '../../status_code.dart';

part 'tmdb_http_store.g.dart';

class TMDBHttpStore = _TMDBHttpStore with _$TMDBHttpStore;

abstract class _TMDBHttpStore with Store {
  _TMDBHttpStore() {
    //  getTMDBData();
    getMockData();
    getFavouriteList();
  }

  @observable
  List<TMDBModel> result = [];

  @observable
  List<TMDBModel> searchResult = [];

  @observable
  List<TMDBModel> mockDataResult = [];

  static const String mockApi =
      'https://6466f9a32ea3cae8dc22d900.mockapi.io/api/v1/';

  @observable
  bool isFavourite = false;

  TextEditingController searchQuery = TextEditingController();

  @observable
  List<TMDBModel> favouriteMovieList = [];

  // ObservableList<bool> isFavourite = ObservableList.of([]);

  void favouriteMovie(TMDBModel model, String id) async {
    await getFavouriteList().then((value) => favouriteMovieList);
    bool flag = false;
    print('favouriteMovieList $favouriteMovieList');
    if (favouriteMovieList.isEmpty) {
      getFavouriteList();
      print('ADD AND ID : ${model.id}');
      await addToFavouriteMovie(model, id);
    } else {
      for (var value in favouriteMovieList) {
        // debugPrint('value to be check is ${value.title}');
        if (value.title == model.title) {
          // favouriteMovieList.remove(model);
          print('Delete AND ID : ${model.id}');
          deleteFavouriteMovies(model.id!);
          flag = true;
          break;
        }
      }
      if (!flag) {
        getFavouriteList();
        addToFavouriteMovie(model, id);
      }
    }
  }

  bool favouriteOrNot(movieTitle) {
    if (favouriteMovieList.contains(movieTitle)) {
      // debugPrint('Movie contains and return true');
      return true;
    }
    // debugPrint('Movie not contains and return false');
    return false;
  }

  // void showSnackBar(String title) {
  //   ScaffoldMessenger.of(NavigationService().context)
  //       .showSnackBar(SnackBar(content: Text(title)));
  // }

  final String apiKey = '491793e7377166aa3e79127c98891c82&language';
  late String baseURL =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey=en-US&page=1';

  Future<List<TMDBModel>> getTMDBData() async {
    try {
      Response response = await http.get(Uri.parse(baseURL), headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body)['results'];
        result = jsonData.map<TMDBModel>((e) => TMDBModel.fromJson(e)).toList();
        debugPrint('Result is $result');
        print('jsonData[0].id : ${jsonData[0].id}');
      }
    } catch (e) {
      debugPrint('Error Occured at $e');
    }

    return result;
  }

  Future<List<TMDBModel>> getMockData() async {
    try {
      Response response = await http.get(Uri.parse('${mockApi}tmdb_movies'));
      if (response.statusCode == 200) {
        var searchJsonData = json.decode(response.body);
        mockDataResult = searchJsonData
            .map<TMDBModel>((e) => TMDBModel.fromJson(e))
            .toList();
        debugPrint('Search Result is $searchResult');
      }
    } catch (e) {
      debugPrint('Error Occured at $e');
    }
    return mockDataResult;
  }

  Future<List<TMDBModel>> searchMovies(String query) async {
    late String searchURL =
        'https://6466f9a32ea3cae8dc22d900.mockapi.io/api/v1/tmdb_movies/?title=$query';
    try {
      Response response = await http.get(Uri.parse(searchURL));
      if (response.statusCode == StatusCode.success) {
        var searchJsonData = json.decode(response.body);
        searchResult = searchJsonData
            .map<TMDBModel>((e) => TMDBModel.fromJson(e))
            .toList();
        debugPrint('Search Result is $searchResult');
      }
    } catch (e) {
      debugPrint('Error Occured at $e');
    }
    return searchResult;
  }

  void addNewMovies(TMDBModel tmdbModel) async {
    const String mockPutString = '$mockApi/tmdb_movies';
    try {
      Response response =
          await http.post(Uri.parse(mockPutString), body: tmdbModel.toJson());

      if (response.statusCode == StatusCode.created) {
        debugPrint('Data is Added');
      }
    } catch (e) {
      debugPrint('Error Occured at $e');
    }
  }

  Future<List<TMDBModel>> getFavouriteList() async {
    try {
      Response response =
          await http.get(Uri.parse('${mockApi}favourite_movies'));

      if (response.statusCode == StatusCode.success) {
        var favouriteJsonData = json.decode(response.body);
        favouriteMovieList = favouriteJsonData
            .map<TMDBModel>((e) => TMDBModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      debugPrint('Error at $e');
    }

    return favouriteMovieList;
  }

  Future addToFavouriteMovie(TMDBModel tmdbModel, String id) async {
    print(tmdbModel.id);
    try {
      Response response = await http.post(
        Uri.parse('${mockApi}/favourite_movies'),
        body: tmdbModel.toJson(),
      );
      if (response.statusCode == StatusCode.created) {
        debugPrint('Favourite List is $favouriteMovieList');
        debugPrint('${tmdbModel.title} is successfully added in list');
      } else {
        debugPrint('Something is wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void deleteFavouriteMovies(String id) async {
    print('id $id');
    try {
      Response response =
          await http.delete(Uri.parse('${mockApi}favourite_movies/$id'));
      if (response.statusCode == StatusCode.success) {
        debugPrint('Movie deleted from favourite list');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
