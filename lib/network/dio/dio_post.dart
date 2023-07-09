import 'package:flutter/material.dart';
import 'package:practical_5/network/model/http/http_model.dart';
import 'package:practical_5/network/store/http/dio_store.dart';
import 'package:provider/provider.dart';

class DioPostMethod extends StatelessWidget {
  const DioPostMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final readStore = context.read<DioStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Method'),
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
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  readStore.dioPostData(HttpModel(
                    firstName: readStore.firstNameController.text,
                    lastName: readStore.lastNameController.text,
                    email: readStore.emailController.text,
                  ));
                },
                child: const Text('Submit Data'),
              ),

              //Text('Added title is ${readUpdate}'),
            ],
          ),
        ),
      ),
    );
  }
}
