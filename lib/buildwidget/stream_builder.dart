import 'package:flutter/material.dart';

class StreamBuilderStateWidget extends StatefulWidget {
  const StreamBuilderStateWidget({Key? key}) : super(key: key);

  @override
  State<StreamBuilderStateWidget> createState() =>
      _StreamBuilderStateWidgetState();
}

class _StreamBuilderStateWidgetState extends State<StreamBuilderStateWidget> {
  Stream<DateTime> generateNumber() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('STREAM BUILDER'),
        centerTitle: true,
      ),
      //backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
                stream: generateNumber(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.connectionState ==
                          ConnectionState.active ||
                      snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Text('Error');
                    } else if (snapshot.hasData) {
                      return Text(snapshot.data.toString(),
                          style: const TextStyle(
                              color: Colors.teal, fontSize: 20));
                    } else {
                      return const Text('Empty data');
                    }
                  } else {
                    return Text('State: ${snapshot.connectionState}');
                  }
                }),
          ],
        ),
      ),
    );
  }
}
