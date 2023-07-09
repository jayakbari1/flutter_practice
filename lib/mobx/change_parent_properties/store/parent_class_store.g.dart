// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_class_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ParentClassStore on _ParentClassStore, Store {
  late final _$isPostLikeAtom =
      Atom(name: '_ParentClassStore.isPostLike', context: context);

  @override
  bool get isPostLike {
    _$isPostLikeAtom.reportRead();
    return super.isPostLike;
  }

  @override
  set isPostLike(bool value) {
    _$isPostLikeAtom.reportWrite(value, super.isPostLike, () {
      super.isPostLike = value;
    });
  }

  @override
  String toString() {
    return '''
isPostLike: ${isPostLike}
    ''';
  }
}
