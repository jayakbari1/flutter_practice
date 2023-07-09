import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_5/modular/share_same_model/user_dependency.dart';

import 'get_user_email.dart';

class GetUserName extends StatefulWidget {
  const GetUserName({Key? key}) : super(key: key);

  @override
  State<GetUserName> createState() => _GetUserNameState();
}

class _GetUserNameState extends State<GetUserName> {
  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();

    @override
    void dispose() {
      userNameController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Name'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Enter your Name'),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: userNameController,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Modular.get<GetUserDetails>().newUserName =
                        userNameController.text;
                  });
                },
                child: const Text('Set name')),
            Text(
              Modular.get<GetUserDetails>().username,
            ),
            ElevatedButton(
                onPressed: () => Modular.to.push(
                    MaterialPageRoute(builder: (_) => const GetUserEmail())),
                child: const Text('Next Set Email')),
          ],
        ),
      ),
    );
  }
}
