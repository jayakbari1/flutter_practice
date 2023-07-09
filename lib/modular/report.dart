import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'getdata_using_lazy_singleton.dart';
import 'getdata_using_singlton.dart';

class ShowReport extends StatelessWidget {
  const ShowReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Final Report'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Modular.get<GetDataUsingSingleton>().getEmail.isEmpty
                ? const Text(
                    'No Data Available',
                    style: TextStyle(fontSize: 24),
                  )
                : Text(
                    'Your Email is ${Modular.get<GetDataUsingSingleton>().email}',
                    style: const TextStyle(fontSize: 24),
                  ),
            Modular.get<GetDataUsingLazySingleton>().getUsername!.isEmpty
                ? const Text(
                    'No Data Available',
                    style: TextStyle(fontSize: 24),
                  )
                : Text(
                    'Your Name is ${Modular.get<GetDataUsingLazySingleton>().userName}',
                    style: const TextStyle(fontSize: 24),
                  ),
          ],
        ),
      ),
    );
  }
}
