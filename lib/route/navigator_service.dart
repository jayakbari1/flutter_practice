import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  NavigationService._internal();
  factory NavigationService() => _instance;

  late final NavigatorState currentState = navigationKey.currentState!;

  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  dynamic goBack([dynamic popValue]) {
    return navigationKey.currentState!.pop(popValue);
  }

  BuildContext get context => currentState.context;

  void navigateToScreen(String page, {arguments}) =>
      navigationKey.currentState?.pushNamed(page, arguments: arguments);

  void replaceScreen(Widget page, {arguments}) async =>
      navigationKey.currentState!.pushReplacement(
        MaterialPageRoute(
          builder: (_) => page,
        ),
      );

  void popToFirst() =>
      navigationKey.currentState!.popUntil((route) => route.isFirst);
}
