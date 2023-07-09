import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterStateNotifierProvider extends StateNotifier {
  CounterStateNotifierProvider() : super(0);

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }

  void reset() {
    state = 0;
  }
}

final stateNotifierProvider =
    StateNotifierProvider((ref) => CounterStateNotifierProvider());

class StateNotifierProviderExample extends ConsumerWidget {
  const StateNotifierProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(stateNotifierProvider, (previous, next) {
      print(next.toString());
      if (int.parse(next.toString()) < 0) {
        ref.read(stateNotifierProvider.notifier).state = 0;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Sorry Number Can't be Negative"),
          duration: Duration(seconds: 1),
        ));
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier Example'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) => Text(
            'Counter: ${ref.watch(stateNotifierProvider).toString()}',
            style: const TextStyle(fontSize: 50),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: ref.read(stateNotifierProvider.notifier).increment,
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: '2',
            onPressed: ref.read(stateNotifierProvider.notifier).decrement,
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: '3',
            onPressed: ref.read(stateNotifierProvider.notifier).reset,
            child: const Icon(Icons.lock_reset),
          ),
        ],
      ),
    );
  }
}
