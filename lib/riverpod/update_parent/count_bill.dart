import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practical_5/riverpod/update_parent/update_burger_prize.dart';
import 'package:practical_5/riverpod/update_parent/update_parent.dart';

final countBill = StateProvider((ref) {
  return ref.watch(pizzaProvider) + ref.watch(burgerProvider);
});

class CountBill extends ConsumerWidget {
  const CountBill({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Total Bill'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (context, ref, child) {
              return Text(
                'Bill is ${ref.watch(countBill)}',
                style: const TextStyle(fontSize: 25),
              );
            }),
            ElevatedButton(
              onPressed: () {
                ref.read(pizzaProvider.notifier).state = 0;
                ref.read(burgerProvider.notifier).state = 0;
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const UpdateParentData()),
                    (route) => false);
              },
              child: const Text('Completed Order'),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (_) => const UpdateParentData()),
                        (route) => false);
                  },
                  child: const Text('Edit Pizza Quantity'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (_) => const UpdateBurgerPrize()),
                        (route) => false);
                  },
                  child: const Text('Edit Burger Quantity'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
