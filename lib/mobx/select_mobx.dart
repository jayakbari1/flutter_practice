import 'package:flutter/material.dart';
import 'package:practical_5/extension/provider_extension.dart';
import 'package:practical_5/mobx/change_parent_properties/child_class.dart';
import 'package:practical_5/mobx/change_parent_properties/store/child_class_store.dart';
import 'package:practical_5/mobx/change_parent_properties/store/parent_class_store.dart';
import 'package:practical_5/mobx/mobx_bill_page.dart';
import 'package:practical_5/mobx/mobx_home.dart';
import 'package:practical_5/mobx/observable_future.dart';
import 'package:practical_5/mobx/observable_list_page.dart';
import 'package:practical_5/mobx/observable_stream_page.dart';
import 'package:practical_5/route/routes.dart';

import 'change_parent_properties/parent_class.dart';

class SelectMobXTopic extends StatelessWidget {
  const SelectMobXTopic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select MobX Topic'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MobXHome(),
                  ),
                );
              },
              child: const Text(
                'Simple Counter App',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MobXCountBill(),
                  ),
                );
              },
              child: const Text(
                'Generate Bill Using Compute Concept',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ObServableListPage(),
                  ),
                );
              },
              child: const Text(
                'Observable List',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FutureObservableExample(),
                  ),
                );
              },
              child: const Text(
                'Observable Future',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ObservableStreamExample(),
                  ),
                );
              },
              child: const Text(
                'Observable Stream',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ParentClass(
                      index: 2,
                    ).withProvider(ParentClassStore()),
                  ),
                );
              },
              child: const Text(
                'Parent Class',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChildClass()
                        .accessParentProvider<ParentClassStore,
                            ChildClassStore>(ChildClassStore()),
                  ),
                );
              },
              child: const Text(
                'Change parent properties through child',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.modularRoutes);
              },
              child: const Text(
                'Change parent properties through child using Module',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
