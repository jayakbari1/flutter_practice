import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_5/modular/share_same_model/user_dependency.dart';

class FinalReportForSameModule extends StatelessWidget {
  const FinalReportForSameModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Final Report'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Modular.get<GetUserDetails>().username.isEmpty
                ? const Text(
                    'No Data Available',
                    style: TextStyle(fontSize: 24),
                  )
                : Text(
                    'Your Name is ${Modular.get<GetUserDetails>().username}',
                    style: const TextStyle(fontSize: 24),
                  ),
            Modular.get<GetUserDetails>().email.isEmpty
                ? const Text('No Data Available',
                    style: TextStyle(fontSize: 24))
                : Text('Your Email is ${Modular.get<GetUserDetails>().email}',
                    style: const TextStyle(fontSize: 24)),
            Modular.get<GetUserDetails>().phoneNumber.isEmpty
                ? const Text('No Data Available',
                    style: TextStyle(fontSize: 24))
                : Text(
                    'Your Name is ${Modular.get<GetUserDetails>().phoneNumber}',
                    style: const TextStyle(fontSize: 24))
          ],
        ),
      ),
    );
  }
}
