import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practical_5/CupertinoWidgets/Cupertino_activity_Indicator.dart';
import 'package:practical_5/CupertinoWidgets/context_menu.dart';
import 'package:practical_5/CupertinoWidgets/cupertino_list_tile.dart';
import 'package:practical_5/CupertinoWidgets/cupertino_tab_scaffold.dart';
import 'package:practical_5/CupertinoWidgets/date_time_picker.dart';
import 'package:practical_5/CupertinoWidgets/scrollbar.dart';

class CupertinoActionsheetWidget extends StatefulWidget {
  const CupertinoActionsheetWidget({Key? key}) : super(key: key);

  @override
  State<CupertinoActionsheetWidget> createState() =>
      _CupertinoActionsheetWidgetState();
}

class _CupertinoActionsheetWidgetState
    extends State<CupertinoActionsheetWidget> {
  @override
  void initState() {
    print('Called initState');
    print('$mounted is called from init State');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('Call didChangeDependencies');
    print('$mounted from didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CupertinoActionsheetWidget oldWidget) {
    print('$mounted from didUpdate');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('Mounted is called');
    print('$mounted from deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose is called');
    print('$mounted from dispose is called');
    super.dispose();
  }

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Column(
          children: const [
            Text('Alert'),
            Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ],
        ),
        content: const Text('Proceed with destructive action?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  showAlertDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Column(
            children: const <Widget>[
              Text('CupertinoAlertDialog'),
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ],
          ),
          content: const Text('An iOS-style alert dialog.'
              'An alert dialog informs the user about situations that require acknowledgement.'
              ' An alert dialog has an optional title, optional content, and an optional list of actions.'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('Go To ScrollBbar Widget'),
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const ScrollbarWidget()));
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: const Text('Go to Indicator Widget'),
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) =>
                            const CupertinoActivityIndicatorWidget()));
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: true,
      ),

      //CupertinoPage Scaffold is similar to the AppBar
      child: CupertinoPageScaffold(
        backgroundColor: Colors.deepPurple.shade100,
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Cupertino Widget'),
          backgroundColor: Colors.teal,
          trailing: Icon(
            CupertinoIcons.person_alt_circle_fill,
            color: Colors.tealAccent,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton.filled(
                disabledColor: Colors.black38,
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoActionSheet(
                        title: const Text('This is CupertinoActionSheet'),
                        message: const Text('Select Your Option'),
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: () {},
                            child: const Text(
                              'data',
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Cupertino Action Sheet Widget'),
              ),
              const SizedBox(
                height: 10,
              ),
              CupertinoButton(
                color: Colors.teal,
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const ScrollbarWidget()));
                },
                child: const Text('Get List Using Scrollable Widget'),
              ),
              const SizedBox(
                height: 10,
              ),
              CupertinoButton(
                color: Colors.tealAccent.shade100,
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              const CupertinoActivityIndicatorWidget()));
                },
                child: const Text(
                  'Get CupertinoIndicator Widget',
                  style: TextStyle(color: Colors.black38),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CupertinoButton(
                color: CupertinoColors.systemYellow.elevatedColor,
                onPressed: () {
                  showAlertDialog();
                },
                child: const Text(
                  'Get AlertDialogBox Widget',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CupertinoButton(
                color: CupertinoColors.black,
                onPressed: () {
                  _showAlertDialog(context);
                },
                child: const Text(
                  'Get SampleDialog Widget',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CupertinoButton(
                color: CupertinoColors.inactiveGray,
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => const ContextMenuWidget(),
                    ),
                  );
                },
                child: const Text(
                  'Get ContextMenu Widget',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CupertinoButton(
                color: CupertinoColors.systemPink,
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => const DateTimePickerWidget(),
                    ),
                  );
                },
                child: const Text(
                  'Get Date-Time Picker Widget',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CupertinoButton(
                color: CupertinoColors.systemTeal,
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => const CupertinoListTileWidget(),
                    ),
                  );
                },
                child: const Text(
                  'Get CupertinoList Tile Widget',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CupertinoButton(
                color: CupertinoColors.systemPurple,
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => CupertinoTabScaffoldWidget(),
                    ),
                  );
                },
                child: const Text(
                  'Get CupertinoTabScaffold Widget',
                ),
              ),
            ],
          ),
        ),

        //
      ),
    );
  }
}
