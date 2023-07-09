import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SameModuleHomePage extends StatelessWidget {
  const SameModuleHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Let\'s Start'),
          onPressed: () {
            Modular.to.pushNamed('/shareModel/getUserName');
            // Modular.to.push(
            //     MaterialPageRoute(builder: (context) => const GetUserName()));
          },
        ),
      ),
    );
  }
}
