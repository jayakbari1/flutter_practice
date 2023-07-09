import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:practical_5/BLoc/BLoc/bloc_counter_state.dart';

abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

class BlocCounter extends Bloc<CounterEvent, BlocCounterState> {
  BlocCounter() : super(BlocCounterState(blocCounter: 0)) {
    Logger logger = Logger();

    on<IncrementEvent>((event, emit) {
      logger.wtf('Emitted new Event Increment with ${state.blocCounter + 1}');
      emit(BlocCounterState(blocCounter: state.blocCounter + 1));
    });

    on<DecrementEvent>((event, emit) {
      logger.wtf('Emitted new Event Decrement with ${state.blocCounter - 1}');
      emit(BlocCounterState(blocCounter: state.blocCounter - 1));
    });
  }

  /// This is deprecated after V 8.0.0
  // Stream<BlocCounterState> mapToEventState(CounterEvent event) async* {
  //   switch (event) {
  //     case CounterEvent.increment:
  //       emit(BlocCounterState(blocCounter: state.blocCounter + 1));
  //       break;
  //     case CounterEvent.decrement:
  //       emit(BlocCounterState(blocCounter: state.blocCounter - 1));
  //       break;
  //   }
  // }
}
