import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GetDataUsingLazySingleton {
  GetDataUsingLazySingleton() {
    debugPrint('Lazy Singleton Constructor is Called');
  }

  String? userName = '';

  String? get getUsername => userName;

  set newUserName(String? name) => userName = name;

/*  Widget getDataUsingLazySingleton(String name, String department) {
    return Text("Name is $name and $department");
  }*/
}

class GetDataUsingLazySingletonExample extends StatefulWidget {
  const GetDataUsingLazySingletonExample({Key? key}) : super(key: key);

  @override
  State<GetDataUsingLazySingletonExample> createState() =>
      _GetDataUsingLazySingletonExampleState();
}

class _GetDataUsingLazySingletonExampleState
    extends State<GetDataUsingLazySingletonExample> {
  TextEditingController userNameController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lazy Singleton Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Enter your Name'),
            TextField(
              controller: userNameController,
            ),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Modular.get<GetDataUsingLazySingleton>().newUserName =
                      userNameController.text;
                });
                debugPrint(Modular.get<GetDataUsingLazySingleton>().userName);
              },
              child: const Text(
                'Set',
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              Modular.get<GetDataUsingLazySingleton>().getUsername!,
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
