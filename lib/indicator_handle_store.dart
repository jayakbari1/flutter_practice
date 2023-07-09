import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:practical_5/alert_dialog_box_common_class.dart';

part 'indicator_handle_store.g.dart';

class HandleIndicator = _HandleIndicator with _$HandleIndicator;

abstract class _HandleIndicator with Store {
  final BuildContext handleIndicatorContext;

  @observable
  bool isLoading = true;

  @observable
  List data = [];

  _HandleIndicator(this.handleIndicatorContext) {
    Future.delayed(const Duration(seconds: 25));
    //fetchData();
  }
  final nameString = Completer<String>();

  void showScaffoldMessenger() {
    ScaffoldMessenger.of(handleIndicatorContext).showSnackBar(
      const SnackBar(
        content: Text('oops!!! Not able to fetch data'),
      ),
    );
  }

  void handleApiResponse() {
    isLoading = !isLoading;

    data.isEmpty
        ? showScaffoldMessenger()
        : Navigator.pop(handleIndicatorContext);
  }

  void fetchData() async {
    var response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    debugPrint('Response is $response');
    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        data = json['data'];
      }
    } catch (e) {
      debugPrint('Error!! $e');
    }
  }

  void showAlertDialog(String? title, VoidCallback callback) {
    showDialog(
      context: handleIndicatorContext,
      builder: (context) {
        return GenericAlertDialogBox(
          function: callback,
          title: title,
          child: Observer(
            builder: (context) {
              return !isLoading
                  ? LoadingAnimationWidget.twistingDots(
                      leftDotColor: const Color(0xFF1A1A3F),
                      rightDotColor: const Color(0xFFEA3799),
                      size: 20)
                  : const Text('Yes');
            },
          ),
        );
      },
    );
  }
}
