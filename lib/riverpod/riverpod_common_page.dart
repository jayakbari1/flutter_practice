import 'package:flutter/material.dart';
import 'package:practical_5/riverpod/future_riverpod_example.dart';
import 'package:practical_5/riverpod/riverpod_counter.dart';
import 'package:practical_5/riverpod/state_notifier_provider_example.dart';
import 'package:practical_5/riverpod/state_preserve/state_preserve_example.dart';
import 'package:practical_5/riverpod/stream_riverpod_example.dart';
import 'package:practical_5/riverpod/update_parent/update_parent.dart';

class RiverPodCommonPage extends StatelessWidget {
  const RiverPodCommonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverPod Examples'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const RiverPodCounterExample()));
              },
              child: const Text('StateNotifier Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const StateNotifierProviderExample()));
              },
              child: const Text('StateNotifierProvider Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const FutureRiverPodExample()));
              },
              child: const Text('FutureProvider Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const StreamRiverPodExample()));
              },
              child: const Text('StreamProvider Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const StatePreserveExample()));
              },
              child: const Text('State Preserve'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const UpdateParentData()));
              },
              child: const Text('Update Child to Parent'),
            ),
          ],
        ),
      ),
    );
  }
}
