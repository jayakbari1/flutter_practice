import 'package:flutter_bloc/flutter_bloc.dart';

abstract class TextFormEvent {}

class ChangeImageOnTextForm extends TextFormEvent {}

class LoadingImageEvent extends TextFormEvent {}

abstract class ImageState {
  int get number => 0;
}

class FetchingState extends ImageState {}

class FetchedState extends ImageState {
  @override
  int number;
  FetchedState(this.number);
}

class BLocExample extends Bloc<TextFormEvent, ImageState> {
  BLocExample() : super(FetchingState()) {
    on<LoadingImageEvent>((event, emit) {
      emit(FetchingState());
    });
    on<ChangeImageOnTextForm>((event, emit) {
      emit(FetchedState(state.number));
    });
  }
}
