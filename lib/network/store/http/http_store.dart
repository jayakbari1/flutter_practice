import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:practical_5/network/model/http/http_model.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

import '../../status_code.dart';

part 'http_store.g.dart';

class HttpStore = _HttpStore with _$HttpStore;

abstract class _HttpStore with Store implements Disposable {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  ObservableList<HttpModel> result = ObservableList.of([]);

  _HttpStore() {
    getResponse();
  }

  String url =
      'https://api-experiment-a08fa-default-rtdb.firebaseio.com/userprofile.json';

  final HttpWithMiddleware httpClient = HttpWithMiddleware.build(middlewares: [
    HttpLogger(logLevel: LogLevel.BODY),
  ]);

  Future<List<HttpModel>> getResponse() async {
    final response = await httpClient.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );

    try {
      if (response.statusCode == StatusCode.success) {
        var resultData = jsonDecode(response.body) as Map<String, dynamic>;
        debugPrint('Result data is $resultData');
        resultData.forEach((profileId, profileData) {
          result.add(HttpModel.fromJson(profileData, profileId));
        });
        //debugPrint('result is $result');
      } else {
        debugPrint('Sorry!! Get an Error');
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return result;
  }

  Future<void> getResponseOnRefresh() async {
    final response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );

    try {
      if (response.statusCode == 200) {
        var resultData = jsonDecode(response.body) as Map<String, dynamic>;
        debugPrint('Result data is $resultData');
        resultData.forEach((profileId, profileData) {
          result.add(HttpModel.fromJson(profileData, profileId));
        });
        debugPrint('result is $result');
      } else {
        debugPrint('Sorry!! Get an Error');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void postData(HttpModel httpModel) async {
    try {
      final response = await httpClient.post(
        Uri.parse(url),
        body: jsonEncode(
          httpModel.toJson(),
        ),
      );
      if (response.statusCode == StatusCode.created) {
        debugPrint('Data Added Successfully');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> patchData(HttpModel httpModel, String userId) async {
    String updateURL =
        'https://api-experiment-a08fa-default-rtdb.firebaseio.com/userprofile/$userId.json';
    debugPrint('Updated URL is $updateURL');
    final response = await httpClient.patch(Uri.parse(updateURL),
        body: json.encode(httpModel.toJson()));

    var data = response.body;
    HttpModel result;
    debugPrint('Data is updated $data');

    try {
      if (response.statusCode == StatusCode.success) {
        var responseData = jsonDecode(response.body);
        // debugPrint('Updated data is $responseData');
        result = HttpModel.fromJson(responseData);
        //debugPrint('Updated result is $result');
      } else {
        debugPrint('Oops!! Something went Wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> putData(HttpModel httpModel) async {
    final response = await httpClient.patch(Uri.parse(url),
        body: json.encode(httpModel.toJson()));

    var data = response.body;
    HttpModel result;
    debugPrint('Data is updated $data');

    try {
      if (response.statusCode == StatusCode.success) {
        var responseData = jsonDecode(response.body);
        debugPrint('Updated data is $responseData');
        result = HttpModel.fromJson(responseData);
        debugPrint('Updated result is $result');
      } else {
        debugPrint('Oops!! Something went Wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteUser(String userId) async {
    final src =
        'https://api-experiment-a08fa-default-rtdb.firebaseio.com/userprofile/$userId.json';

    try {
      final response = await http.delete(Uri.parse(src));

      if (response.statusCode == StatusCode.success) {
        debugPrint('Deleted');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void fillPatchController(int index) {
    firstNameController.text = result[index].firstName;
    lastNameController.text = result[index].lastName;
    emailController.text = result[index].email;
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    // TODO: implement dispose
  }
}
