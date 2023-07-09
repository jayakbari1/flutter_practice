import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/repo.dart';

abstract class ImageEvent {}

class InitialEvent extends ImageEvent {}

class LoadEvent extends ImageEvent {}

abstract class ImageState {
  int counter;
  ImageState(this.counter);
}

class LoadingState extends ImageState {
  LoadingState(super.counter);
}

class LoadedState extends ImageState {
  final String img;
  final int num;
  LoadedState(this.img, this.num) : super(num);
}

class ErrorState extends ImageState {
  ErrorState(super.counter);
}

class BlocRepo extends Bloc<ImageEvent, ImageState> {
  final ImageRepository imageRepository = ImageRepository();

  BlocRepo() : super(LoadingState(1)) {
    onChange<LoadEvent>(Change<ImageState> change) {
      super.onChange(change);
      debugPrint(change.toString());
      debugPrint(change.currentState.toString());
      debugPrint(change.nextState.toString());
    }

    on<InitialEvent>((event, emit) {
      emit(LoadingState(1));
    });
    on<LoadEvent>((event, emit) {
      try {
        print('State Counter :: ${state.counter}');
        final img = imageRepository.getImage((state.counter + 1).toString());

        emit(LoadedState(img, state.counter + 1));
      } catch (e) {
        emit(ErrorState(1));
      }
    });
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    // debugPrint(bloc.toString());
    // debugPrint(bloc.state.toString());
    // //debugPrint(change.nextState.toString());
    // print(event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint(change.toString());
    debugPrint(change.currentState.toString());
    debugPrint(change.nextState.toString());
    print(change);
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    //print(bloc);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('From onTransition');
    debugPrint(transition.event.toString());
    //print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    //print(error);
    super.onError(bloc, error, stackTrace);
  }
}
