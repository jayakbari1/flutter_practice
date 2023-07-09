import 'dart:async';

import 'package:flutter/material.dart';

class TabPageSelectorWidget extends StatefulWidget {
  const TabPageSelectorWidget({Key? key}) : super(key: key);

  @override
  State<TabPageSelectorWidget> createState() => _TabPageSelectorWidgetState();
}

class _TabPageSelectorWidgetState extends State<TabPageSelectorWidget>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;
  late final Timer _timer;
  static const _colors = [
    Colors.red,
    Colors.yellow,
    Colors.blueAccent,
  ];
  int _index = 0;
  void _circulate() {
    (_index != _colors.length - 1) ? _index++ : _index = 0;
    _controller.animateTo(_index);
    setState(() {
      print(_index);
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 3,
      initialIndex: _index,
      vsync: this,
    );
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _circulate(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('T A B B A R S E L E C T O R'),
        backgroundColor: Colors.deepPurple.shade400,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(color: _colors[_controller.index]),
          Positioned(
            bottom: 20,
            child: TabPageSelector(
              controller: _controller,
              color: Colors.black38,
              selectedColor: Colors.white30,
            ),
          ),
        ],
      ),
    );
  }
}
