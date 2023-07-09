import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({Key? key}) : super(key: key);

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool _isActiveCheckBox = false;
  String string = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CHECKBOX WIDGET'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade300,
      ),
      body: Column(
        children: [
          CheckboxListTile(
              title: const Text('Agree or Not'),
              value: _isActiveCheckBox,
              onChanged: (result) {
                setState(() {
                  _isActiveCheckBox = result!;
                  if (_isActiveCheckBox) {
                    string = 'You Press the Checkbox';
                  } else {
                    string = 'You Unchecked the box';
                  }
                });
              }),
          Text(
            string,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
