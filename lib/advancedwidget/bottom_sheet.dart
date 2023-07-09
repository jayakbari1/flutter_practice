import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: true,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('BOTTOM SHEET WIDGET'),
          centerTitle: true,
          backgroundColor: Colors.teal.shade300,
        ),
        body: Center(
          child: Tooltip(
            message:
                'This is done with ToolTip Widget and this is the Bottom Sheet Widget Class',
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 500,
                        width: 100,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text(
                                'Modal BottomSheet',
                                style: TextStyle(color: Colors.teal),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple,
                                ),
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Close BottomSheet'),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: const Text('Click to get Bottom Sheet Widget'),
            ),
          ),
        ),
      ),
    );
  }
}
