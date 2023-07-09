import 'package:flutter/material.dart';

class ExpandedFlexWidget extends StatefulWidget {
  const ExpandedFlexWidget({Key? key}) : super(key: key);

  @override
  State<ExpandedFlexWidget> createState() => _ExpandedFlexWidgetState();
}

class _ExpandedFlexWidgetState extends State<ExpandedFlexWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              heightFactor: 2,
              child: Container(
                color: Colors.teal,
                height: 100,
                width: 100,
              ),
            ),
            // Spacer(),
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                //color: Colors.purple,
                gradient: RadialGradient(
                  colors: [Colors.red, Colors.cyan, Colors.purple],
                  // begin: Alignment.centerRight,
                  // end: new Alignment(-1.0, 0.0)
                ),
              ),
            ),
            // Spacer(),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              child: Container(
                color: Colors.blueAccent,
                height: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
