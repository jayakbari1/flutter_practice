import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:practical_5/extension/provider_extension.dart';
import 'package:practical_5/network/http/http_patch.dart';
import 'package:provider/provider.dart';

import '../store/http/http_store.dart';

class HttpGetMethod extends StatelessWidget {
  const HttpGetMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readStore = context.read<HttpStore>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Http Method'),
      ),
      body: Observer(builder: (context) {
        return readStore.result.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: readStore.result.length,
                itemBuilder: (_, index) {
                  log('User id is ${readStore.result[index].userId}');
                  stdout.writeln(
                      'User Id from debugPrint is ${readStore.result[index].userId}');
                  // f.debugPrint(
                  //     'User Id from debugPrint is ${readStore.result[index].userId}');
                  return GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 2.0,
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'First Name :: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: readStore.result[index].firstName
                                          .toString(),
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Last Name :: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: readStore.result[index].lastName
                                          .toString(),
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Email :: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: readStore.result[index].email
                                          .toString(),
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              HttpPatchMethod(index: index)
                                                  .withProvider(
                                            HttpStore(),
                                          ),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green),
                                    child: const Text('Update User'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      readStore.deleteUser(readStore
                                          .result[index].userId
                                          .toString());
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    child: const Text('Delete User'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
      }),
    );
  }
}
