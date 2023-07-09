import 'package:flutter/material.dart';

class TestViewWidget extends StatefulWidget {
  const TestViewWidget({Key? key}) : super(key: key);

  @override
  State<TestViewWidget> createState() => _TestViewWidgetState();
}

class _TestViewWidgetState extends State<TestViewWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Table(
          border: TableBorder.all(color: Colors.green, width: 1.5),
          columnWidths: const {
            0: FlexColumnWidth(1.5),
            1: FlexColumnWidth(4),
            2: FlexColumnWidth(2),
          },
          children: const [
            TableRow(children: [
              Text(
                '1',
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                'Mohit',
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                '25',
                style: TextStyle(fontSize: 15.0),
              ),
            ]),
            TableRow(children: [
              Text(
                '2',
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                'Ankit',
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                '27',
                style: TextStyle(fontSize: 15.0),
              ),
            ]),
            TableRow(children: [
              Text(
                '3',
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                'Rakhi',
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                '26',
                style: TextStyle(fontSize: 15.0),
              ),
            ]),
            TableRow(children: [
              Text(
                '4',
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                'Yash',
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                '29',
                style: TextStyle(fontSize: 15.0),
              ),
            ]),
            TableRow(children: [
              Text(
                '5',
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                'Pragati',
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                '28',
                style: TextStyle(fontSize: 15.0),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
