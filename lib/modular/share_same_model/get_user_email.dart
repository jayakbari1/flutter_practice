import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_5/modular/share_same_model/get_user_phone_number.dart';
import 'package:practical_5/modular/share_same_model/user_dependency.dart';

class GetUserEmail extends StatefulWidget {
  const GetUserEmail({Key? key}) : super(key: key);

  @override
  State<GetUserEmail> createState() => _GetUserEmailState();
}

class _GetUserEmailState extends State<GetUserEmail> {
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Email'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Enter your Name'),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: emailController,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Modular.get<GetUserDetails>().newUserEmail =
                        emailController.text;
                  });
                },
                child: const Text('Set Email')),
            Text(
              Modular.get<GetUserDetails>().email,
            ),
            ElevatedButton(
                onPressed: () {
                  Modular.to.push(MaterialPageRoute(
                      builder: (_) => const GetUserPhoneNumber()));
                },
                child: const Text('Next Set PhoneNumber')),
          ],
        ),
      ),
    );
  }
}
