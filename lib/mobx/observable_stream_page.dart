import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:practical_5/mobx/store/stream_observable.dart';

class ObservableStreamExample extends StatelessWidget {
  const ObservableStreamExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final streamObservabel = StreamObservable();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Observable Stream Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Random number',
              style: TextStyle(color: Colors.grey),
            ),
            Observer(
              warnWhenNoObservables: true,
              name: 'Jay',
              builder: (_) {
                final value = streamObservabel.observableStream.value;
                return Text(
                  '${value ?? '---'}',
                  style: const TextStyle(fontSize: 96),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
