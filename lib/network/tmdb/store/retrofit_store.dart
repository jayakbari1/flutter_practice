import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:practical_5/network/dio/dio_singleton.dart';
import 'package:practical_5/network/tmdb/store/retrofit_api_service.dart';
import 'package:practical_5/network/tmdb/store/tmdb_dio_store.dart';

import '../../status_code.dart';

part 'retrofit_store.g.dart';

class RetrofitStore = _RetrofitStore with _$RetrofitStore;

abstract class _RetrofitStore with Store {
  _RetrofitStore() {
    print('HELLO');
    retrofitGetData();
    retrofitFavouriteData();
    retrofitMultipleQueries();
  }

  @observable
  NetworkState networkState = NetworkState.initial;

  final dio = SingletonDio().dio;

  late final client = RestClient(dio);

  ObservableList<TMDBRetrofitModel> retrofitResponse = ObservableList.of([]);

  ObservableList<TMDBRetrofitModel> retrofitFavouriteResponse =
      ObservableList.of([]);

  TextEditingController searchController = TextEditingController();

  Future<void> retrofitGetData() async {
    log('List is added');
    retrofitResponse.clear();
    try {
      final response = await client.getRetrofitDetails();
      networkState = NetworkState.loading;
      log('In Loading State....');
      if (response.response.statusCode == StatusCode.success) {
        log('Response success now decode');
        log('In Success State');
        retrofitResponse.addAll(response.response.data
            .map<TMDBRetrofitModel>((e) => TMDBRetrofitModel.fromJson(e))
            .toList());
        networkState = NetworkState.success;
      }
      //retrofitResponse.addAll(await client.getRetrofitDetails());
    } catch (e, s) {
      networkState = NetworkState.failure;
      log('In Failure State');
      log('Get Error During Fetching All Movies and error is $e with Stack trace $s');
    }
  }

  Future<void> retrofitSearchData(String title) async {
    log('Search is called');
    try {
      retrofitResponse.clear();
      log('Api Response is ${await client.queryResponse(title)}');
      retrofitResponse.addAll(await client.queryResponse(title));
      debugPrint('Retrofit Search Response is $retrofitResponse');
    } catch (e, s) {
      log('Get Error During Searching Movies and error is $e with Stack trace $s');
    }
  }

  Future<void> retrofitFavouriteData() async {
    try {
      retrofitFavouriteResponse.addAll(await client.getFavouriteList());
    } catch (e, s) {
      log('Get Error During Searching Movies and error is $e with Stack trace $s');
    }
  }

  Future<void> retrofitDeleteMovie(String id) async {
    client.deleteMovie(id);
  }

  List r = [];

  Future<void> retrofitMultipleQueries() async {
    print('CAlled');
    try {
      r.addAll(
        await client.getMoviesUsingMultipleQueries(
          {'title': 'Fast X', 'release_date': '2023-05-17'},
        ),
      );
      log(r.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Check During Add Favourite Movies
  void favouriteMovie(TMDBRetrofitModel model) async {
    await client.getFavouriteList().then((value) => retrofitFavouriteResponse);
    bool flag = false;
    print('favouriteMovieList $retrofitFavouriteResponse');
    if (retrofitFavouriteResponse.isEmpty) {
      print('ADD AND ID : ${model.id}');
      await client.pushMovie(model);
    } else {
      for (var value in retrofitFavouriteResponse) {
        if (value.title == model.title) {
          flag = true;
          break;
        }
      }
      if (!flag) {
        client.getFavouriteList();
        client.pushMovie(model);
      }
    }
  }

  Future<void> refreshFavouriteList() async {
    retrofitFavouriteResponse.clear();
    retrofitFavouriteResponse.addAll(await client.getFavouriteList());
  }
}
