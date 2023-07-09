import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GetDataUsingSingleton {
  String email = 'AAA';

  GetDataUsingSingleton() {
    debugPrint('Singleton Constructor is Called');
  }

  String get getEmail => email;

  set setEmail(String newEmail) => email = newEmail;

  /*Widget getDataUsingSingletonExample(String email) {
    return Text("Your Email is $email");
  }*/
}

class GetDataUsingSingletonExample extends StatefulWidget {
  const GetDataUsingSingletonExample({Key? key}) : super(key: key);

  @override
  State<GetDataUsingSingletonExample> createState() =>
      _GetDataUsingSingletonExampleState();
}

class _GetDataUsingSingletonExampleState
    extends State<GetDataUsingSingletonExample> {
  TextEditingController userTextEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Singleton Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userTextEditController,
            ),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Modular.get<GetDataUsingSingleton>().setEmail =
                      userTextEditController.text;
                });

                debugPrint(Modular.get<GetDataUsingSingleton>().email);
              },
              child: const Text(
                'Set',
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              Modular.get<GetDataUsingSingleton>().getEmail,
            ),
            ElevatedButton(
              onPressed: () {
                Modular.reassemble();
              },
              child: const Text(
                'Click',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
