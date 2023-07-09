// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'future_observable.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ObservableFutureExample on _ObservableFutureExample, Store {
  late final _$responseAtom =
      Atom(name: '_ObservableFutureExample.response', context: context);

  @override
  List<dynamic> get response {
    _$responseAtom.reportRead();
    return super.response;
  }

  @override
  set response(List<dynamic> value) {
    _$responseAtom.reportWrite(value, super.response, () {
      super.response = value;
    });
  }

  @override
  String toString() {
    return '''
response: ${response}
    ''';
  }
}
