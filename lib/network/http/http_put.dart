import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_5/network/store/http/http_store.dart';

import '../model/http/http_model.dart';

class HttpPutMethod extends StatelessWidget {
  const HttpPutMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readStore = context.read<HttpStore>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Put Method'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: readStore.firstNameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter First Name'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: readStore.lastNameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter Last Name'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: readStore.emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter Email'),
              ),
              ElevatedButton(
                  onPressed: () async {
                    // debugPrint(
                    //     'Id will be sent is ${readStore.result[index].userId.toString()}');
                    readStore.putData(
                      HttpModel(
                        firstName: readStore.firstNameController.text,
                        lastName: readStore.lastNameController.text,
                        email: readStore.emailController.text,
                      ),
                    );
                  },
                  child: const Text('Put Data'))
            ],
          ),
        ),
      ),
    );
  }
}
