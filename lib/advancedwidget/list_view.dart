import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<Choice> choices = <Choice>[
      Choice(title: 'Home', icon: Icons.home),
      Choice(title: 'Contact', icon: Icons.contacts),
      Choice(title: 'Map', icon: Icons.map),
      Choice(title: 'Phone', icon: Icons.phone),
      Choice(title: 'Camera', icon: Icons.camera_alt),
      Choice(title: 'Setting', icon: Icons.settings),
      Choice(title: 'Album', icon: Icons.photo_album),
      Choice(title: 'WiFi', icon: Icons.wifi),
      Choice(title: 'Album', icon: Icons.photo_album),
      Choice(title: 'WiFi', icon: Icons.wifi),
    ];

    return Theme(
      data: ThemeData(
        useMaterial3: true,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('LISTVIEW WIDGET'),
          backgroundColor: Colors.yellowAccent,
        ),
        body: ListView.builder(
          itemCount: choices.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 100,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(choices[index].title!),
                    Icon(choices[index].icon),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Choice {
  final String? title;
  final IconData? icon;
  const Choice({this.title, this.icon});
}
