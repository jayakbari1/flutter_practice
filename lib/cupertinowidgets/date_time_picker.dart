import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePickerWidget extends StatefulWidget {
  const DateTimePickerWidget({Key? key}) : super(key: key);

  @override
  State<DateTimePickerWidget> createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<DateTimePickerWidget> {
  DateTime? _chosenDateTime;

  DateTime now = DateTime.now();
  String formattedDate =
      DateFormat('MM/dd/yyyy, hh:mm a').format(DateTime.now()).toString();

  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 500,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    child: CupertinoDatePicker(
                        initialDateTime: DateTime.now(),
                        use24hFormat: false,
                        mode: CupertinoDatePickerMode.dateAndTime,
                        onDateTimeChanged: (val) {
                          setState(() {
                            _chosenDateTime = val;
                            formattedDate = DateFormat('MM/dd/yyyy, hh:mm a')
                                .format(_chosenDateTime!)
                                .toString();
                          });
                        }),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.of(ctx).pop(),
                  )
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DATE-TIME PICKER'),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    _showDatePicker(context);
                  },
                  child: const Text('Select your Date')),
              Text(_chosenDateTime != null
                  ? formattedDate
                  : 'No date time picked!'),
              const SizedBox(
                height: 10,
              ),
              const Text('Below Date is Without Formating'),
              Text(_chosenDateTime != null
                  ? _chosenDateTime.toString()
                  : 'No date time picked!'),
              const SizedBox(
                height: 10,
              ),
              const Text('Below Date is Without Formating'),
              Text(_chosenDateTime != null
                  ? _chosenDateTime!.timeZoneOffset.toString().trimRight()
                  : 'No date time picked!'),
            ],
          ),
        ),
      ),
    );
  }
}
