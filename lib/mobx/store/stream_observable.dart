import 'dart:async';
import 'dart:math';

import 'package:mobx/mobx.dart';

part 'stream_observable.g.dart';

class StreamObservable = _StreamObservable with _$StreamObservable;

abstract class _StreamObservable with Store {
  late final ObservableStream<int> observableStream;

  _StreamObservable() {
    _streamController = StreamController<int>();
    timer = Timer.periodic(const Duration(seconds: 5), (_) {
      _streamController.add(Random.secure().nextInt(100));
    });

    observableStream = ObservableStream(_streamController.stream);
  }

  late final Timer timer;
  late final StreamController<int> _streamController;

  void dispose() async {
    await _streamController.close();
  }
}
