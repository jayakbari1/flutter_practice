import 'package:flutter/material.dart';

class ExpansionTileWidget extends StatefulWidget {
  const ExpansionTileWidget({Key? key}) : super(key: key);

  @override
  State<ExpansionTileWidget> createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  List<Item> items = [
    Item(header: 'First Value', body: 'This is first value description'),
    Item(header: 'Second Value', body: 'This is Second value description'),
    Item(header: 'Third Value', body: 'This is Third value description'),
    Item(header: 'Fourth Value', body: 'This is Fourth value description'),
    Item(header: 'Fifth Value', body: 'This is Fifth value description'),
    Item(header: 'Six Value', body: 'This is Sixth value description'),
    Item(header: 'Seven Value', body: 'This is Seventh value description'),
    Item(header: 'Eight Value', body: 'This is Eight value description'),
    Item(header: 'Nine Value', body: 'This is Nine value description'),
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.amber,
      ),
      child: Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text('EXPANSION TILE WIDGET'),
          backgroundColor: Colors.lightGreen,
        ),
        body: ListView(
          children: [
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  items[index].isExpanded = !items[index].isExpanded;
                });
              },
              // children: items.map((Item item){
              //   return ExpansionPanel(
              //       headerBuilder: (BuildContext context, bool isExpanded){
              //         return Container(
              //
              //         );
              //       },
              //       body: body)
              // }),
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  String? body;
  String? header;
  bool isExpanded;
  Item({
    this.header,
    this.body,
    this.isExpanded = false,
  });
}
