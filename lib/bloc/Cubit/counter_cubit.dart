import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_cubit_state.dart';

// class CounterCubit extends Cubit<int> {
//   int counter = 0;
//
//   Logger logger = Logger();
//
//   // CounterCubit() : super(CounterInitial(counterValue: 0));
//
//   CounterCubit() : super(0);
//
//   void increment() {
//     logger.d("Increment Event is Emit");
//     emit(state + 1);
//   }
//
//   void decrement() {
//     logger.w("Decrement Event is Emit");
//     emit(state - 1);
//   }
// }

class CounterCubit0 extends Cubit<CounterInitial0> {
  CounterCubit0() : super(CounterInitial0(counterValue0: 0));

  void incrementCounterInitial0() =>
      emit(CounterInitial0(counterValue0: state.counterValue0 + 1));

  void decrementCounterInitial0() =>
      emit(CounterInitial0(counterValue0: state.counterValue0 + 1));
}

class CounterCubit1 extends Cubit<CounterInitial1> {
  CounterCubit1() : super(CounterInitial1(counterValue1: 0));

  void incrementCounterInitial1() {
    emit(CounterInitial1(counterValue1: state.counterValue1 + 1));
  }

  void decrementCounterInitial1() {
    emit(CounterInitial1(counterValue1: state.counterValue1 - 1));
  }
}

class CounterCubit2 extends Cubit<CounterInitial2> {
  CounterCubit2() : super(CounterInitial2(counterValue2: 0));

  void incrementCounterInitial2() {
    emit(CounterInitial2(counterValue2: state.counterValue2 + 1));
  }

  void decrementCounterInitial2() {
    emit(CounterInitial2(counterValue2: state.counterValue2 - 1));
  }
}

class CounterCubit3 extends Cubit<CounterInitial3> {
  CounterCubit3() : super(CounterInitial3(counterValue3: 0));

  void incrementCounterInitial3() {
    emit(CounterInitial3(counterValue3: state.counterValue3 + 1));
  }

  void decrementCounterInitial3() {
    emit(CounterInitial3(counterValue3: state.counterValue3 - 1));
  }
}
