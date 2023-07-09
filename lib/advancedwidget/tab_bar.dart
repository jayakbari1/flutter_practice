import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 5, vsync: this);
    _controller.addListener(() {
      print(_controller.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.deepPurple[100],
      ),
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _controller,
            //To make tabs scrollable
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            dividerColor: Colors.grey,
            indicatorColor: Colors.tealAccent,
            indicatorWeight: 2,
            // indicator: BoxDecoration(
            //   color: Colors.black38,
            //   borderRadius: BorderRadius.circular(25),
            // ),
            // indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                  color: Colors.deepPurple.shade900,
                ),
              ),
              Tab(
                icon: Icon(Icons.settings, color: Colors.deepPurple.shade900),
              ),
              Tab(
                icon: Icon(Icons.person_outline_outlined,
                    color: Colors.deepPurple.shade900),
              ),
              Tab(
                icon: Icon(Icons.share, color: Colors.deepPurple.shade900),
              ),
              Tab(
                icon: Icon(Icons.feed_outlined,
                    color: Colors.deepPurple.shade900),
              ),
            ],
          ),
          title: const Text('T A B B A R'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple[400],
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: const [
                  FirstTab(),
                  SecondTab(),
                  ThirdTab(),
                  FourthTab(),
                  FifthTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstTab extends StatelessWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[50],
      child: const Center(
        child: Text(
          '1st Tab',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}

class SecondTab extends StatelessWidget {
  const SecondTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[50],
      child: const Center(
        child: Text(
          '2nd Tab',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}

class ThirdTab extends StatelessWidget {
  const ThirdTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[50],
      child: const Center(
        child: Text(
          '3rd Tab',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}

class FourthTab extends StatelessWidget {
  const FourthTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[50],
      child: const Center(
        child: Text(
          '4th Tab',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}

class FifthTab extends StatelessWidget {
  const FifthTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[50],
      child: const Center(
        child: Text(
          '5th Tab',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
