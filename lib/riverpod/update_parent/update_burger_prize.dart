import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practical_5/riverpod/update_parent/count_bill.dart';

final burgerProvider = StateProvider((ref) => 0);

class UpdateBurgerPrize extends ConsumerWidget {
  const UpdateBurgerPrize({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      burgerProvider,
      (previous, next) {
        if (next < 0) {
          ref.watch(burgerProvider.notifier).state = 0;
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
        title: const Text('Add Burger For Bill'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (context, ref, child) {
              return Text(
                'Burger Price: ${ref.watch(burgerProvider)}',
                style: const TextStyle(fontSize: 25),
              );
            }),
            ElevatedButton(
              onPressed: () {
                ref.read(burgerProvider.notifier).state =
                    ref.read(burgerProvider.notifier).state + 50;
              },
              child: const Text('Add Burger'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(burgerProvider.notifier).state =
                    ref.read(burgerProvider.notifier).state - 50;
              },
              child: const Text('Remove Burger'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(burgerProvider.notifier).state = 0;
              },
              child: const Text('Reset Burger'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const CountBill()));
        },
        tooltip: "Count bill",
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
