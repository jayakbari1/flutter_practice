import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.purple,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CARD WIDGET'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Card(
                elevation: 25,
                shadowColor: Colors.purple,
                surfaceTintColor: Colors.tealAccent,
                borderOnForeground: false,
                color: Colors.deepPurple,
                // semanticContainer: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'This is the Card',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              final snackBar = SnackBar(
                                duration: const Duration(seconds: 2),
                                content: const Text('You Press the Ok Button'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {},
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            child: const Text('OK')),
                        ElevatedButton(
                            onPressed: () {
                              final snackBar = SnackBar(
                                duration: const Duration(seconds: 2),
                                content:
                                    const Text('You Press the Cancel Button'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {},
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            child: const Text('Cancel')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text('Below is Circular Progress indicator'),
            const CircularProgressIndicator(
              color: Colors.tealAccent,
              backgroundColor: Colors.deepPurple,
              strokeWidth: 5,
              semanticsLabel: 'Circular Progress Indicator',
            ),
            const SizedBox(
              height: 50,
            ),
            const Text('Linear Progress Indicator'),
            const LinearProgressIndicator(
              backgroundColor: Colors.teal,
              minHeight: 5,
              color: Colors.black38,
              //value: 50,
            ),
          ],
        ),
      ),
    );
  }
}
