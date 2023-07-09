import 'package:flutter/material.dart';

class RadioWidget extends StatefulWidget {
  const RadioWidget({Key? key}) : super(key: key);

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  String gender = 'male';

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('R A D I O W I D G E T'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            RadioMenuButton(
              value: 'male',
              groupValue: gender,
              onChanged: (val) {
                setState(() {
                  gender = val.toString();
                });
              },
              child: const Text('Male'),
            ),
            RadioMenuButton(
              value: 'female',
              groupValue: gender,
              onChanged: (val) {
                setState(() {
                  gender = val.toString();
                });
              },
              child: const Text('Female'),
            ),
            RadioMenuButton(
              value: 'other',
              groupValue: gender,
              onChanged: (val) {
                setState(() {
                  gender = val.toString();
                });
              },
              child: const Text('Other'),
            ),
          ],
        ),
      ),
    );
  }
}
