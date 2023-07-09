import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.deepPurple,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: const Text('Drawer Widget'),
          centerTitle: true,
        ),
        drawer: Drawer(
          backgroundColor: Colors.black12,
          shadowColor: Colors.red[200],
          elevation: 5.0,
          child: ListView(
            children: [
              Column(
                children: [
                  DrawerHeader(
                    child: CircleAvatar(
                      // backgroundImage: AssetImage('assets/FlutterLogo.png'),
                      backgroundColor: Colors.red[100],
                      radius: 250,
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Jay Akbari, Flutter Developer',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: Colors.red[300],
                    height: 2,
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text('Home'),
                  ),
                  const ListTile(
                    iconColor: Colors.white,
                    leading: Icon(Icons.book),
                    title: Text('Get Course'),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.subscriptions,
                      color: Colors.white,
                    ),
                    title: Text('Subscription'),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    title: Text('Share'),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.reviews,
                      color: Colors.white,
                    ),
                    title: Text('Feedback'),
                  ),
                  const AboutListTile(
                    applicationIcon: Icon(Icons.abc),
                    applicationName: 'Policy-Privacy',
                    applicationVersion: '1.0',
                    icon: Icon(Icons.app_blocking_outlined),
                    dense: false,
                    child: Text('About App'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
