import 'package:flutter/material.dart';

class GetXSecondPage extends StatelessWidget {
  const GetXSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page of GetX'),
      ),
      body: const Center(
        child: Text(
          'GetX Second Page',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
