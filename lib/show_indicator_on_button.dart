import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:practical_5/indicator_handle_store.dart';
import 'package:provider/provider.dart';

class ShowAlertDialogAndShowIndicator extends StatelessWidget {
  const ShowAlertDialogAndShowIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readStore = context.read<HandleIndicator>();
    final watchStore = context.watch<HandleIndicator>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Alert Dialog in API'),
      ),
      body: Observer(
        builder: (context) {
          return watchStore.isLoading
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => watchStore.showAlertDialog(
                            'Are you Want Data', readStore.handleApiResponse),
                        child: const Text('Get Data'),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: watchStore.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Id is ${watchStore.data[index]['id']}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Email is ${watchStore.data[index]['email']}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'First name is ${watchStore.data[index]['first_name']}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
