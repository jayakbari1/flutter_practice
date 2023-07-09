// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_dio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TMDBDioStore on _TMDBDioStore, Store {
  late final _$appStateAtom =
      Atom(name: '_TMDBDioStore.appState', context: context);

  @override
  NetworkState get appState {
    _$appStateAtom.reportRead();
    return super.appState;
  }

  @override
  set appState(NetworkState value) {
    _$appStateAtom.reportWrite(value, super.appState, () {
      super.appState = value;
    });
  }

  late final _$dioSearchResultAtom =
      Atom(name: '_TMDBDioStore.dioSearchResult', context: context);

  @override
  List<TMDBModel> get dioSearchResult {
    _$dioSearchResultAtom.reportRead();
    return super.dioSearchResult;
  }

  @override
  set dioSearchResult(List<TMDBModel> value) {
    _$dioSearchResultAtom.reportWrite(value, super.dioSearchResult, () {
      super.dioSearchResult = value;
    });
  }

  late final _$dioMockDataResultAtom =
      Atom(name: '_TMDBDioStore.dioMockDataResult', context: context);

  @override
  List<TMDBModel> get dioMockDataResult {
    _$dioMockDataResultAtom.reportRead();
    return super.dioMockDataResult;
  }

  @override
  set dioMockDataResult(List<TMDBModel> value) {
    _$dioMockDataResultAtom.reportWrite(value, super.dioMockDataResult, () {
      super.dioMockDataResult = value;
    });
  }

  late final _$favouriteMovieListAtom =
      Atom(name: '_TMDBDioStore.favouriteMovieList', context: context);

  @override
  List<TMDBModel> get favouriteMovieList {
    _$favouriteMovieListAtom.reportRead();
    return super.favouriteMovieList;
  }

  @override
  set favouriteMovieList(List<TMDBModel> value) {
    _$favouriteMovieListAtom.reportWrite(value, super.favouriteMovieList, () {
      super.favouriteMovieList = value;
    });
  }

  @override
  String toString() {
    return '''
appState: ${appState},
dioSearchResult: ${dioSearchResult},
dioMockDataResult: ${dioMockDataResult},
favouriteMovieList: ${favouriteMovieList}
    ''';
  }
}
