import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GetDataUsingFactory {
  GetDataUsingFactory() {
    debugPrint('Factory Constructor is Called');
  }

  Widget getDataUsingFactoryFunction(String mobileNumber) {
    return Text('Your Mobile Number is $mobileNumber');
  }
}

class GetDataUsingFactoryExample extends StatelessWidget {
  const GetDataUsingFactoryExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factory Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Modular.get<GetDataUsingFactory>()
                .getDataUsingFactoryFunction('8758770017'),
          ],
        ),
      ),
    );
  }
}
