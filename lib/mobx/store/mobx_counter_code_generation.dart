import 'package:mobx/mobx.dart';

part 'mobx_counter_code_generation.g.dart';

class MobXCodeGeneration = _MobXCodeGeneration with _$MobXCodeGeneration;

abstract class _MobXCodeGeneration with Store {
  @observable
  int counter = 0;

  @action
  void increment() {
    counter++;
  }

  @action
  void decrement() {
    counter--;
  }

  @action
  void reset() {
    counter = 0;
  }
}
