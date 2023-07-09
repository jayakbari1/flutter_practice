import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_5/modular/share_same_model/fina_report.dart';
import 'package:practical_5/modular/share_same_model/user_dependency.dart';

class GetUserPhoneNumber extends StatefulWidget {
  const GetUserPhoneNumber({Key? key}) : super(key: key);

  @override
  State<GetUserPhoneNumber> createState() => _GetUserPhoneNumberState();
}

class _GetUserPhoneNumberState extends State<GetUserPhoneNumber> {
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Phone Number'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Enter your Phone Number'),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: phoneNumberController,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Modular.get<GetUserDetails>().phoneNumber =
                        phoneNumberController.text;
                  });
                },
                child: const Text('Set Phone Number')),
            Text(
              Modular.get<GetUserDetails>().userPhoneNumber,
            ),
            ElevatedButton(
                onPressed: () {
                  Modular.to.push(MaterialPageRoute(
                      builder: (_) => const FinalReportForSameModule()));
                },
                child: const Text('Get the Report')),
          ],
        ),
      ),
    );
  }
}
