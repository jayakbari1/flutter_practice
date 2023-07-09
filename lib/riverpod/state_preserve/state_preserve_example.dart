import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practical_5/riverpod/state_preserve/screen1.dart';
import 'package:practical_5/riverpod/state_preserve/screen2.dart';
import 'package:practical_5/riverpod/state_preserve/screen3.dart';

final counterProvider = StateProvider((ref) => 0);

class StatePreserveExample extends ConsumerStatefulWidget {
  const StatePreserveExample({Key? key}) : super(key: key);

  @override
  ConsumerState<StatePreserveExample> createState() =>
      _StatePreserveExampleState();
}

class _StatePreserveExampleState extends ConsumerState<StatePreserveExample> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pages = const [
    StatePreserveScreen1(),
    StatePreserveScreen2(),
    StatePreserveScreen3()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.yellow),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.blue,
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 40,
        onTap: _onItemTapped,
        elevation: 5,
      ),
    );
  }
}
