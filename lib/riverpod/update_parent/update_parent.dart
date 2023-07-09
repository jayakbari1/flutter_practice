import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practical_5/riverpod/update_parent/update_burger_prize.dart';

final pizzaProvider = StateProvider((ref) => 0);

class UpdateParentData extends ConsumerWidget {
  const UpdateParentData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      pizzaProvider,
      (previous, next) {
        if (next < 0) {
          ref.watch(pizzaProvider.notifier).state = 0;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Sorry You can't remove"),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Pizza For Bill'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (context, ref, child) {
              return Text(
                'Pizza Price: ${ref.watch(pizzaProvider)}',
                style: const TextStyle(fontSize: 25),
              );
            }),
            ElevatedButton(
              onPressed: () {
                ref.read(pizzaProvider.notifier).state =
                    ref.read(pizzaProvider.notifier).state + 50;
              },
              child: const Text('Add Pizza'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(pizzaProvider.notifier).state =
                    ref.read(pizzaProvider.notifier).state - 50;
              },
              child: const Text('Remove Pizza'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(pizzaProvider.notifier).state = 0;
              },
              child: const Text('Reset Pizza'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const UpdateBurgerPrize()));
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
