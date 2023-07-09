import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:practical_5/network/dio/dio_singleton.dart';
import 'package:practical_5/network/model/json_placeholder_model.dart';
import 'package:practical_5/network/status_code.dart';
import 'package:practical_5/route/navigator_service.dart';

import '../../model/http/http_model.dart';
import '../../tmdb/model/tmdb_model.dart';

part 'dio_store.g.dart';

class DioStore extends _DioStore with _$DioStore {
  static const Map<String, dynamic> header = {
    'Content-Type': 'application/json',
  };
}

abstract class _DioStore with Store implements Disposable {
  //ObservableList<HttpModel> dioResult = ObservableList.of([]);
  @observable
  List<HttpModel> dioResult = [];

  @observable
  List<TMDBModel> mockDataResult = [];

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final dio = SingletonDio().dio;

  String baseUrl = 'https://jsonplaceholder.typicode.com/todos';

  _DioStore() {
    //initInterceptors();
    // dioGetData();
    getMockData();
    // SingletonDio().prepareJar();
    //LoggingInterceptors();
    //dioGetData();
  }

  // void initInterceptors() {
  //   SingletonDio().dio.interceptors.add(
  //         InterceptorsWrapper(
  //           onRequest: (requestOptions, handler) {
  //             logger.i(
  //                 'REQUEST[${requestOptions.method}] => PATH: ${requestOptions.path}'
  //                 '=> REQUEST VALUES: ${requestOptions.queryParameters} => HEADERS: ${requestOptions.headers}');
  //             return handler.next(requestOptions);
  //           },
  //           onResponse: (response, handler) {
  //             logger.i(
  //                 'RESPONSE[${response.statusCode}] => DATA: ${response.data}');
  //             return handler.next(response);
  //           },
  //           onError: (err, handler) {
  //             logger.i('Error[${err.response?.statusCode}]');
  //             return handler.next(err);
  //           },
  //         ),
  //       );
  // }

  // Future<List<HttpModel>> dioGetData() async {
  //   final response = await SingletonDio().dio.get(baseUrl);
  //   List<HttpModel> tempData = [];
  //
  //   try {
  //     if (response.statusCode == 200) {
  //       var jsonData = response.data as Map<String, dynamic>;
  //       debugPrint('Json Data is $jsonData}');
  //       jsonData.forEach((profileId, profileData) {
  //         tempData.add(HttpModel.fromJson(profileData, profileId));
  //       });
  //     } else {
  //       debugPrint('Something is Wrong!!!');
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  //   dioResult = tempData;
  //   //debugPrint('DioResult is $dioResult');
  //   return dioResult.toSet().toList();
  // }
  //
  // Future<void> dioPostData(HttpModel dioHttpModel) async {
  //   final response =
  //       await SingletonDio().dio.post(baseUrl, data: dioHttpModel.toJson());
  //
  //   try {
  //     if (response.statusCode == 201) {
  //       debugPrint('Data is Fetched');
  //     } else {
  //       debugPrint('Something is Wrong!!!');
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  //   //debugPrint('DioResult is $dioResult');
  // }

  static const String mockApi =
      'https://6466f9a32ea3cae8dc22d900.mockapi.io/api/v1/';
  Future<List<TMDBModel>> getMockData() async {
    try {
      Response response = await dio.get(('http://surl.li/heyvj'));
      if (response.statusCode == 200) {
        var searchJsonData = response.data;
        debugPrint('Status Message is ${response.statusMessage}');
        for (int i = 0; i < response.redirects.length; i++) {
          debugPrint(
              'Redirects location is ${response.redirects[i].location} and Status code is ${response.redirects[i].statusCode} ');
        }
        debugPrint('Path is ${response.requestOptions.path}');
        //debugPrint(
        //  'Redirect Record is ${response.redirects.first.location} and ${response.redirects.first.method} and ${response.redirects.first.statusCode}');
        debugPrint('Header is ${response.requestOptions.headers}');
        debugPrint('Extra Parameter is ${response.extra}');
        debugPrint('Real URI URI is ${response.realUri}');
        debugPrint(
            ' max redirects is ${response.requestOptions.maxRedirects.toString()}');
        response.isRedirect = false;
        mockDataResult = searchJsonData
            .map<TMDBModel>((e) => TMDBModel.fromJson(e))
            .toList();
        //  debugPrint('Search Result is $mockDataResult');
      }
    } catch (e) {
      debugPrint('Error Occured at $e');
    }
    return mockDataResult;
  }

  @observable
  List<JsonPlaceHolderTodos> todosResult = [];

  Future<List<JsonPlaceHolderTodos>> dioGetData() async {
    final Response response = await SingletonDio().dio.get(baseUrl);

    print(response.data);
    try {
      if (response.statusCode == StatusCode.success) {
        var jsonData = response.data;
        todosResult = jsonData
            .map<JsonPlaceHolderTodos>((e) => JsonPlaceHolderTodos.fromJson(e))
            .toList();
      } else {
        debugPrint('Something is Wrong!!!');
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return todosResult;
  }

  Future<void> dioPostData(HttpModel dioHttpModel) async {
    final response = await dio.post(baseUrl, data: dioHttpModel.toJson());

    try {
      if (response.statusCode == StatusCode.created) {
        debugPrint('Data is Fetched');
      } else {
        debugPrint('Something is Wrong!!!');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    //debugPrint('DioResult is $dioResult');
  }

  Future<void> dioPatchData(HttpModel httpModel, String userId) async {
    String updateURL =
        'https://api-experiment-a08fa-default-rtdb.firebaseio.com/userprofile/$userId.json';
    debugPrint('Updated URL is $updateURL');
    final response = await dio.patch(updateURL, data: httpModel.toJson());
    HttpModel result;

    try {
      if (response.statusCode == StatusCode.success) {
        var responseData = response.data;
        //   debugPrint('Updated data is $responseData');
        result = HttpModel.fromJson(responseData);
      } else {
        debugPrint('Oops!! Something went Wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> dioDeleteUser(String userId) async {
    final src =
        'https://api-experiment-a08fa-default-rtdb.firebaseio.com/userprofile/$userId.json';

    try {
      Response response = await dio.delete(src);

      if (response.statusCode == StatusCode.success) {
        debugPrint('Deleted');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void fillPatchController(int index) {
    firstNameController.text = dioResult[index].firstName;
    lastNameController.text = dioResult[index].lastName;
    emailController.text = dioResult[index].email;
  }

  void updateUser(String userId) {
    showModalBottomSheet(
      context: NavigationService().context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => NavigationService().goBack(),
                      icon: const Icon(
                        Icons.cancel,
                      ),
                    ),
                    const Text('Update', style: TextStyle(fontSize: 18)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      TextFormField(
                        maxLines: 1,
                        autofocus: true,
                        controller: firstNameController,
                        style: const TextStyle(fontSize: 18),
                        decoration: const InputDecoration(
                          floatingLabelStyle: TextStyle(color: Colors.green),
                          label: Text('first name'),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: lastNameController,
                        style: const TextStyle(fontSize: 18),
                        decoration: const InputDecoration(
                          floatingLabelStyle: TextStyle(color: Colors.green),
                          labelText: 'Last name',
                          focusColor: Colors.teal,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: emailController,
                        style: const TextStyle(fontSize: 18),
                        decoration: const InputDecoration(
                          floatingLabelStyle: TextStyle(color: Colors.green),
                          labelText: 'Email',
                          focusColor: Colors.teal,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          dioPatchData(
                            HttpModel(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              email: emailController.text,
                            ),
                            userId,
                          ).then((value) => dioGetData());
                          NavigationService().goBack();
                        },
                        child: const Text('update'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    //SingletonDio().dio.close();
    debugPrint('Dispose is Called');
    // TODO: implement dispose
  }
}
