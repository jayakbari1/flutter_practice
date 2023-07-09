import 'package:flutter/material.dart';

class SimpleDilogBoxWidget extends StatefulWidget {
  const SimpleDilogBoxWidget({Key? key}) : super(key: key);

  @override
  State<SimpleDilogBoxWidget> createState() => _SimpleDilogBoxWidgetState();
}

class _SimpleDilogBoxWidgetState extends State<SimpleDilogBoxWidget> {
  @override
  Widget build(BuildContext context) {
    Future<void> SimpleDialogBox() async {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: const Text('This is the Simlpe Dialog'),
              children: [
                const SimpleDialogOption(
                  child: Text('Flutter'),
                ),
                const SimpleDialogOption(
                  child: Text('React Native'),
                ),
                const SimpleDialogOption(
                  child: Text('Native'),
                ),
                const SimpleDialogOption(
                  child: Text('Mern or Mean'),
                ),
                TextButton(onPressed: () {}, child: const Text('Ok')),
                TextButton(onPressed: () {}, child: const Text('Cancel')),
              ],
            );
          });
    }

    return Theme(
      data: ThemeData(useMaterial3: true, primarySwatch: Colors.deepPurple),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SIMPLE DIALOG BOX'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Click for the Simple Dialog Box'),
            onPressed: () {
              const SimpleDialog();
            },
          ),
        ),
      ),
    );
  }
}
