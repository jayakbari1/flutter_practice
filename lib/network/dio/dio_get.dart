import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:practical_5/network/store/http/dio_store.dart';
import 'package:provider/provider.dart';

class DioGetMethod extends StatelessWidget {
  const DioGetMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readStore = context.read<DioStore>();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Dio Get Example'),
        ),
        // body: SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       Observer(
        //         builder: (context) {
        //           return readStore.dioResult.isEmpty
        //               ? const Center(
        //                   child: CircularProgressIndicator(),
        //                 )
        //               : RefreshIndicator(
        //                   onRefresh: readStore.dioGetData,
        //                   child: ListView.builder(
        //                     scrollDirection: Axis.vertical,
        //                     shrinkWrap: true,
        //                     physics: const NeverScrollableScrollPhysics(),
        //                     itemCount: readStore.dioResult.length,
        //                     itemBuilder: (_, index) {
        //                       debugPrint(
        //                           'User Id is ${readStore.dioResult[index].userId}');
        //                       return GestureDetector(
        //                         child: Padding(
        //                           padding: const EdgeInsets.all(8.0),
        //                           child: Card(
        //                             elevation: 2.0,
        //                             margin:
        //                                 const EdgeInsets.fromLTRB(10, 0, 0, 0),
        //                             child: Padding(
        //                               padding: const EdgeInsets.all(8.0),
        //                               child: Column(
        //                                 crossAxisAlignment:
        //                                     CrossAxisAlignment.start,
        //                                 children: [
        //                                   RichText(
        //                                     text: TextSpan(
        //                                       children: [
        //                                         const TextSpan(
        //                                           text: 'First Name :: ',
        //                                           style: TextStyle(
        //                                               fontWeight: FontWeight.bold,
        //                                               color: Colors.black),
        //                                         ),
        //                                         TextSpan(
        //                                           text: readStore
        //                                               .dioResult[index].firstName
        //                                               .toString(),
        //                                           style: const TextStyle(
        //                                               color: Colors.black),
        //                                         ),
        //                                       ],
        //                                     ),
        //                                   ),
        //                                   RichText(
        //                                     text: TextSpan(
        //                                       children: [
        //                                         const TextSpan(
        //                                           text: 'Last Name :: ',
        //                                           style: TextStyle(
        //                                               fontWeight: FontWeight.bold,
        //                                               color: Colors.black),
        //                                         ),
        //                                         TextSpan(
        //                                           text: readStore
        //                                               .dioResult[index].lastName
        //                                               .toString(),
        //                                           style: const TextStyle(
        //                                               color: Colors.black),
        //                                         ),
        //                                       ],
        //                                     ),
        //                                   ),
        //                                   RichText(
        //                                     text: TextSpan(
        //                                       children: [
        //                                         const TextSpan(
        //                                           text: 'Email :: ',
        //                                           style: TextStyle(
        //                                               fontWeight: FontWeight.bold,
        //                                               color: Colors.black),
        //                                         ),
        //                                         TextSpan(
        //                                           text: readStore
        //                                               .dioResult[index].email
        //                                               .toString(),
        //                                           style: const TextStyle(
        //                                               color: Colors.black),
        //                                         ),
        //                                       ],
        //                                     ),
        //                                   ),
        //                                   Row(
        //                                     mainAxisAlignment:
        //                                         MainAxisAlignment.spaceAround,
        //                                     children: [
        //                                       ElevatedButton(
        //                                         onPressed: () {
        //                                           readStore
        //                                               .fillPatchController(index);
        //                                           readStore.updateUser(readStore
        //                                               .dioResult[index].userId
        //                                               .toString());
        //                                         },
        //                                         style: ElevatedButton.styleFrom(
        //                                             backgroundColor:
        //                                                 Colors.green),
        //                                         child: const Text('Update User'),
        //                                       ),
        //                                       ElevatedButton(
        //                                         onPressed: () {
        //                                           readStore.dioDeleteUser(
        //                                               readStore
        //                                                   .dioResult[index].userId
        //                                                   .toString());
        //                                         },
        //                                         style: ElevatedButton.styleFrom(
        //                                             backgroundColor: Colors.red),
        //                                         child: const Text('Delete User'),
        //                                       ),
        //                                     ],
        //                                   ),
        //                                 ],
        //                               ),
        //                             ),
        //                           ),
        //                         ),
        //                       );
        //                     },
        //                   ),
        //                 );
        //         },
        //       ),
        //       ElevatedButton(
        //         onPressed: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (_) =>
        //                       const DioPostMethod().withProvider(DioStore())));
        //         },
        //         style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        //         child: const Text('Add New User'),
        //       ),
        //     ],
        //   ),
        // ),
        body: Observer(
          builder: (context) {
            return readStore.todosResult.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: readStore.todosResult.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Id is :: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                  TextSpan(
                                    text: readStore.todosResult[index].id
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'User Id :: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                  TextSpan(
                                    text: readStore.todosResult[index].userId
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Title :: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                  TextSpan(
                                    text: readStore.todosResult[index].title
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'isCompleted :: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                  TextSpan(
                                    text: readStore.todosResult[index].completed
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
          },
        ));
  }
}
