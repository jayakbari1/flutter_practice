// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_http_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TMDBHttpStore on _TMDBHttpStore, Store {
  late final _$resultAtom =
      Atom(name: '_TMDBHttpStore.result', context: context);

  @override
  List<TMDBModel> get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(List<TMDBModel> value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  late final _$searchResultAtom =
      Atom(name: '_TMDBHttpStore.searchResult', context: context);

  @override
  List<TMDBModel> get searchResult {
    _$searchResultAtom.reportRead();
    return super.searchResult;
  }

  @override
  set searchResult(List<TMDBModel> value) {
    _$searchResultAtom.reportWrite(value, super.searchResult, () {
      super.searchResult = value;
    });
  }

  late final _$mockDataResultAtom =
      Atom(name: '_TMDBHttpStore.mockDataResult', context: context);

  @override
  List<TMDBModel> get mockDataResult {
    _$mockDataResultAtom.reportRead();
    return super.mockDataResult;
  }

  @override
  set mockDataResult(List<TMDBModel> value) {
    _$mockDataResultAtom.reportWrite(value, super.mockDataResult, () {
      super.mockDataResult = value;
    });
  }

  late final _$isFavouriteAtom =
      Atom(name: '_TMDBHttpStore.isFavourite', context: context);

  @override
  bool get isFavourite {
    _$isFavouriteAtom.reportRead();
    return super.isFavourite;
  }

  @override
  set isFavourite(bool value) {
    _$isFavouriteAtom.reportWrite(value, super.isFavourite, () {
      super.isFavourite = value;
    });
  }

  late final _$favouriteMovieListAtom =
      Atom(name: '_TMDBHttpStore.favouriteMovieList', context: context);

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
result: ${result},
searchResult: ${searchResult},
mockDataResult: ${mockDataResult},
isFavourite: ${isFavourite},
favouriteMovieList: ${favouriteMovieList}
    ''';
  }
}
