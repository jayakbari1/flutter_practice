import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:practical_5/mobx/store/observable_list_store.dart';

class ObServableListPage extends StatelessWidget {
  ObServableListPage({Key? key}) : super(key: key);
  final observableList = ObservableListExample();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Observable List Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Observer(
            builder: (context) {
              return SizedBox(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 30,
                      child: Text(
                          'List of Element is ${observableList.listOfInteger[index]}'),
                    );
                  },
                  itemCount: observableList.listOfInteger.length,
                ),
              );
            },
          ),
          Observer(
            builder: (context) {
              return SizedBox(
                height: MediaQuery.of(context).size.width -
                    MediaQuery.of(context).size.width / 2,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 30,
                          child: Text(
                              'List of Element from @observal List ${observableList.list[index]}'),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                  itemCount: observableList.list.length,
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              //observableList.insertElement();
              //observableList.list = observableList.listOfInteger;
              observableList.addElement();
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              observableList.removeElement();
              //observableList.removeElement();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
