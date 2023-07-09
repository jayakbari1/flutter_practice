import 'package:flutter/material.dart';

import '../main.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Screen 1'),
            const SizedBox(height: 30.0),
            ElevatedButton(
              child: const Text('Screen 2'),
              onPressed: () => Navigator.of(context).pushNamed('screen2'),
            ),
            ElevatedButton(
              child: const Text('Screen 3'),
              onPressed: () => Navigator.of(context).pushNamed('screen3'),
            )
          ],
        ),
      ),
    );
  }
}

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    print('didPush Screen2');
  }

  @override
  void didPopNext() {
    print('didPopNext Screen2');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(), body: const Center(child: Text('Screen 2')));
  }
}

// class Screen3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(), body: Center(child: Text('Screen 3')));
//   }
// }

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    print('didPush Screen3');
  }

  @override
  void didPopNext() {
    print('didPopNext Screen3');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Center(
            child: Text('Screen 3'),
          ),
          ElevatedButton(
            child: const Text('Screen 2'),
            onPressed: () => Navigator.of(context).pushNamed('screen2'),
          ),
        ],
      ),
    );
  }
}
