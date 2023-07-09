import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

class Counter {
  Logger logger = Logger();

  Counter() {
    increment = Action(_increment);
    decrement = Action(_decrement);
    reset = Action(_reset);

    reaction((p0) => _value.value == 3, (p0) {
      print('dfdsf');
    });
    autorun((p0) => transaction(() {
          if (_value.value.isEven) {
            print('Auto run is called when value is even');
          } else {
            print('Auto run is called when value is odd');
          }
        }));
    dispose;
  }

  final _value = Observable(0);

  late final dispose =
      when((_) => _value.value == 3, () => print('dispose is called'));

  int get counterValue {
    if (_value.value == 3) {
      autorun((p0) {});
    }
    //logger.e('Now it\'s time to get the value');
    return _value.value;
  }

  late Action increment;
  late Action decrement;
  late Action reset;

  void _increment() {
    _value.value++;
  }

  void _decrement() {
    _value.value--;
  }

  void _reset() {
    _value.value = 0;
  }
}
