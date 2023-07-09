import 'package:flutter/material.dart';

class RetrofitGet extends StatelessWidget {
  const RetrofitGet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrofit Get Methods'),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
