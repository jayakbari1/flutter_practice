import 'package:flutter/material.dart';
import 'package:practical_5/Provider/counter_notifier.dart';
import 'package:provider/provider.dart';

class ProviderScreen2 extends StatelessWidget {
  const ProviderScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Provider<int>.value(
    //   value: Provider.of<Counter>(context).count,
    //   builder: (context, child) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Screen2'),
      ),
      body: Center(
        child: Text(Provider.of<Counter>(context).count.toString()),
      ),
    );
    //   },
    // );
  }
}
