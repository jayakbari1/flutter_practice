import 'package:flutter/material.dart';
import 'package:practical_5/AdvancedWidget/silver_app_bar_widget.dart';

class AlertDialogBoxWidget extends StatefulWidget {
  const AlertDialogBoxWidget({Key? key}) : super(key: key);

  @override
  State<AlertDialogBoxWidget> createState() => _AlertDialogBoxWidgetState();
}

class _AlertDialogBoxWidgetState extends State<AlertDialogBoxWidget> {
  showAlertDoalog(context) {
    Widget okButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SliverAppBarWidget()));
        },
        child: const Text('Ok'));
    Widget cnacelButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Cancel'));

    AlertDialog alertDialog = AlertDialog(
      title: const Text('Practice of AlertDialog'),
      content: const Text('Would you like to continue'),
      icon: const Icon(Icons.add_circle),
      actions: [
        okButton,
        cnacelButton,
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  //Custom Dialog
  callAlertDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'What do you want to remember?'),
                    ),
                    SizedBox(
                      width: 320.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1BC0C5),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  //Full Scree Alert Dialog

  FullScreenAlertDialog() {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              height: MediaQuery.of(context).size.height - 80,
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('This is Full Screen Alert Dialog'),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1BC0C5),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.red,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ALERT DIALOG BOX'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) => RiverPodCounterExample(),
          //       ),
          //     );
          //   },
          //   icon: Icon(
          //     Icons.arrow_back,
          //   ),
          // ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  showAlertDoalog(context);
                },
                child: const Text('Click on Me for Alert Dialog Box'),
              ),
              ElevatedButton(
                onPressed: () {
                  callAlertDialog();
                },
                child: const Text('Click on Me for Custome Alert Dialog Box'),
              ),
              ElevatedButton(
                onPressed: () {
                  FullScreenAlertDialog();
                },
                child:
                    const Text('Click on Me for Full Screen Alert Dialog Box'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
