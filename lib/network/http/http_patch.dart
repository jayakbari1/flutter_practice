import 'package:flutter/material.dart';
import 'package:practical_5/network/store/http/http_store.dart';
import 'package:provider/provider.dart';

import '../model/http/http_model.dart';

class HttpPatchMethod extends StatelessWidget {
  final int index;
  const HttpPatchMethod({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readStore = context.read<HttpStore>();
    print(readStore.emailController.text);
    return Scaffold(
      appBar: AppBar(
        title: Text('Patch Method'),
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
                    debugPrint(
                        'Id will be sent is ${readStore.result[index].userId.toString()}');
                    readStore.patchData(
                        HttpModel(
                          firstName: readStore.firstNameController.text,
                          lastName: readStore.lastNameController.text,
                          email: readStore.emailController.text,
                        ),
                        readStore.result[index].userId.toString());
                  },
                  child: const Text('Update Data'))
            ],
          ),
        ),
      ),
    );
  }
}
