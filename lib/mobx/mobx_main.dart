import 'package:flutter/material.dart';
import 'package:practical_5/mobx/select_mobx.dart';
import 'package:practical_5/route/route_generator.dart';

void backgroundService() {
  print('This is from Back Ground Service');
}

void main(List<String> arguments) async {
  // final isolate = await Isolate.spawn((message) {
  //   print('Recieved Message : $message');
  // }, {});
  // Timer(Duration(seconds: 5), () {
  //   print("Pausing Isolate 1");
  //   isolate.pause();
  // });
  // Timer(Duration(seconds: 10), () {
  //   print("Resuming Isolate 1");
  //   isolate.resume;
  // });
  // Timer(Duration(seconds: 20), () {
  //   print("Killing Isolate 1");
  //   isolate.kill();
  // });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SelectMobXTopic(),
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent.shade100,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
