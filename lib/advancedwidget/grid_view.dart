import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key? key}) : super(key: key);

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
          title: const Text('GRIDVIEW WIDGET'),
          backgroundColor: Colors.tealAccent,
        ),
        // ignore: avoid_unnecessary_containers
        body: Container(
          child: GridView.builder(
            itemCount: choices.length,
            itemBuilder: (context, index) {
              return Card(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(choices[index].title!),
                    Icon(choices[index].icon),
                  ],
                )),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          ),
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
