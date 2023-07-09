import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:practical_5/mobx/store/future_observable.dart';

class FutureObservableExample extends StatefulWidget {
  const FutureObservableExample({Key? key}) : super(key: key);

  @override
  State<FutureObservableExample> createState() =>
      _FutureObservableExampleState();
}

class _FutureObservableExampleState extends State<FutureObservableExample> {
  final futureObservable = ObservableFutureExample();

  @override
  void initState() {
    futureObservable.fetchResponse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Observable Example'),
        centerTitle: true,
      ),
      body: Observer(builder: (context) {
        // return Center(
        //   child: Text(futureObservable.name),
        // );

        return ListView.builder(
            itemCount: futureObservable.response.length,
            itemBuilder: (context, index) {
              // print(futureObservable.observableFuture);
              //  if (futureObservable.observableFuture.value!.isEmpty) {
              //    return CircularProgressIndicator();
              //  } else {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Text(futureObservable.response[index].toString()),
              );
            }
            //},
            );
      }),
    );
  }
}
