// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrofit_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RetrofitStore on _RetrofitStore, Store {
  late final _$networkStateAtom =
      Atom(name: '_RetrofitStore.networkState', context: context);

  @override
  NetworkState get networkState {
    _$networkStateAtom.reportRead();
    return super.networkState;
  }

  @override
  set networkState(NetworkState value) {
    _$networkStateAtom.reportWrite(value, super.networkState, () {
      super.networkState = value;
    });
  }

  @override
  String toString() {
    return '''
networkState: ${networkState}
    ''';
  }
}
