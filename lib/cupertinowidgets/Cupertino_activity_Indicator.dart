import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoActivityIndicatorWidget extends StatelessWidget {
  const CupertinoActivityIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Cupertino Activity Indicator'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                // Cupertino activity indicator with default properties.
                CupertinoActivityIndicator(),
                SizedBox(height: 10),
                Text('Default'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                // Cupertino activity indicator with custom radius and color.
                CupertinoActivityIndicator(
                    radius: 20.0, color: CupertinoColors.activeBlue),
                SizedBox(height: 10),
                Text(
                  'radius: 20.0\ncolor: CupertinoColors.activeBlue',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                // Cupertino activity indicator with custom radius and disabled
                // animation.
                CupertinoActivityIndicator(
                  radius: 20.0,
                  animating: false,
                  color: CupertinoColors.activeOrange,
                ),
                SizedBox(height: 10),
                Text(
                  'radius: 20.0\nanimating: false\ncolor:',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                // Cupertino activity indicator with custom radius and disabled
                // animation.
                CupertinoActivityIndicator.partiallyRevealed(
                  radius: 20.0,
                  color: CupertinoColors.activeOrange,
                  progress: 0.50,
                ),
                SizedBox(height: 10),
                Text(
                  'radius: 20.0\nanimating: false\ncolor:',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
