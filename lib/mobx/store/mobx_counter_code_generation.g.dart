// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_counter_code_generation.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobXCodeGeneration on _MobXCodeGeneration, Store {
  late final _$counterAtom =
      Atom(name: '_MobXCodeGeneration.counter', context: context);

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  late final _$_MobXCodeGenerationActionController =
      ActionController(name: '_MobXCodeGeneration', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_MobXCodeGenerationActionController.startAction(
        name: '_MobXCodeGeneration.increment');
    try {
      return super.increment();
    } finally {
      _$_MobXCodeGenerationActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_MobXCodeGenerationActionController.startAction(
        name: '_MobXCodeGeneration.decrement');
    try {
      return super.decrement();
    } finally {
      _$_MobXCodeGenerationActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$_MobXCodeGenerationActionController.startAction(
        name: '_MobXCodeGeneration.reset');
    try {
      return super.reset();
    } finally {
      _$_MobXCodeGenerationActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counter: ${counter}
    ''';
  }
}
