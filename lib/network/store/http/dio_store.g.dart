// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DioStore on _DioStore, Store {
  late final _$dioResultAtom =
      Atom(name: '_DioStore.dioResult', context: context);

  @override
  List<HttpModel> get dioResult {
    _$dioResultAtom.reportRead();
    return super.dioResult;
  }

  @override
  set dioResult(List<HttpModel> value) {
    _$dioResultAtom.reportWrite(value, super.dioResult, () {
      super.dioResult = value;
    });
  }

  late final _$mockDataResultAtom =
      Atom(name: '_DioStore.mockDataResult', context: context);

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

  late final _$todosResultAtom =
      Atom(name: '_DioStore.todosResult', context: context);

  @override
  List<JsonPlaceHolderTodos> get todosResult {
    _$todosResultAtom.reportRead();
    return super.todosResult;
  }

  @override
  set todosResult(List<JsonPlaceHolderTodos> value) {
    _$todosResultAtom.reportWrite(value, super.todosResult, () {
      super.todosResult = value;
    });
  }

  @override
  String toString() {
    return '''
dioResult: ${dioResult},
mockDataResult: ${mockDataResult},
todosResult: ${todosResult}
    ''';
  }
}
