import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:practical_5/network/dio/dio_singleton.dart';

import '../../status_code.dart';
import '../model/tmdb_model.dart';

part 'tmdb_dio_store.g.dart';

enum NetworkState { initial, loading, success, failure }

class TMDBDioStore = _TMDBDioStore with _$TMDBDioStore;

abstract class _TMDBDioStore with Store {
  _TMDBDioStore() {
    debugPrint('At Initial Stage');
    dioGetMockData();
    getFavouriteList();
  }

  final dio = SingletonDio().dio;

  @observable
  NetworkState appState = NetworkState.initial;

  @observable
  List<TMDBModel> dioSearchResult = [];

  @observable
  List<TMDBModel> dioMockDataResult = [];

  TextEditingController searchQuery = TextEditingController();

  @observable
  List<TMDBModel> favouriteMovieList = [];

  Future<List<TMDBModel>> dioGetMockData() async {
    try {
      appState = NetworkState.loading;
      Response response = await dio.get('tmd_movies');
      debugPrint('In Loading State');
      if (response.statusCode == StatusCode.success) {
        var jsonData = response.data;
        dioMockDataResult =
            jsonData.map<TMDBModel>((e) => TMDBModel.fromJson(e)).toList();
        appState = NetworkState.success;
      }
    } catch (e, s) {
      appState = NetworkState.failure;
      debugPrint('Error Occured at $e and Stacktrace is $s');
    }
    return dioMockDataResult;
  }

  Future<List<TMDBModel>> searchMovies(String query) async {
    try {
      Response response =
          await dio.get('tmdb_movies', queryParameters: {'title': query});
      if (response.statusCode == StatusCode.success) {
        var searchJsonData = response.data;
        dioSearchResult = searchJsonData
            .map<TMDBModel>((e) => TMDBModel.fromJson(e))
            .toList();
        debugPrint('Search Result is $dioSearchResult');
      }
    } catch (e) {
      debugPrint('Error Occured at $e');
    }
    return dioSearchResult;
  }

  /// Check During Add Favourite Movies
  void favouriteMovie(TMDBModel model) async {
    await getFavouriteList().then((value) => favouriteMovieList);
    bool flag = false;
    print('favouriteMovieList $favouriteMovieList');
    if (favouriteMovieList.isEmpty) {
      getFavouriteList();
      print('ADD AND ID : ${model.id}');
      await addToFavouriteMovie(model);
    } else {
      for (var value in favouriteMovieList) {
        // debugPrint('value to be check is ${value.title}');
        if (value.title == model.title) {
          // favouriteMovieList.remove(model);
          // print('Delete AND ID : ${model.id}');
          // deleteFavouriteMovies(model.id!);
          flag = true;
          break;
        }
      }
      if (!flag) {
        getFavouriteList();
        addToFavouriteMovie(model);
      }
    }
  }

  /// Related to Favourite Section Network Call

  Future<List<TMDBModel>> getFavouriteList() async {
    try {
      Response response = await dio.get('favourite_movies');

      if (response.statusCode == StatusCode.success) {
        var favouriteJsonData = response.data;
        favouriteMovieList = favouriteJsonData
            .map<TMDBModel>((e) => TMDBModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      debugPrint('Error at $e');
    }

    return favouriteMovieList;
  }

  Future addToFavouriteMovie(TMDBModel tmdbModel) async {
    print(tmdbModel.id);
    try {
      Response response = await dio.post(
        '/favourite_movies',
        data: tmdbModel.toJson(),
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
      Response response = await dio.delete('favourite_movies/$id');
      if (response.statusCode == 200) {
        debugPrint('Movie deleted from favourite list');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
