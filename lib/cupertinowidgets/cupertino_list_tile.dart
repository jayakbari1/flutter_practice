import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoListTileWidget extends StatefulWidget {
  const CupertinoListTileWidget({Key? key}) : super(key: key);

  @override
  State<CupertinoListTileWidget> createState() =>
      _CupertinoListTileWidgetState();
}

class _CupertinoListTileWidgetState extends State<CupertinoListTileWidget> {
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
  void didUpdateWidget(covariant CupertinoListTileWidget oldWidget) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CUPERTINO LISTTILE WIDGET'),
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
      ),
      body: Center(
        child: CupertinoListSection(
          backgroundColor: Colors.black12,
          children: [
            CupertinoListTile(
              //backgroundColor: Colors.tealAccent,
              title: const Text('This is ListTile'),
              trailing: const CupertinoListTileChevron(),
              leading: Container(
                height: 25,
                color: Colors.teal,
              ),
              additionalInfo: const Text('Additional'),
            ),
            const SizedBox(height: 5),
            CupertinoListTile(
              title: const Text('Push to master'),
              leading: Container(
                width: double.infinity,
                height: double.infinity,
                color: CupertinoColors.systemRed,
              ),
              additionalInfo: const Text('Not available'),
            ),
            CupertinoListTile(
                title: const Text('View last commit'),
                leading: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: CupertinoColors.activeOrange,
                ),
                additionalInfo: const Text('12 days ago'),
                trailing: const CupertinoListTileChevron(),
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
