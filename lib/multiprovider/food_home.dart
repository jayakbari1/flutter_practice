import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'billing.dart';

class FoodHome extends StatelessWidget {
  const FoodHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('FOOD HOME BUILD');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<Billing>(
              builder: (context, billing, child) {
                return Text(
                  'Food Price : ${billing.foodProvider.foodPrice.toString()}',
                  style: const TextStyle(fontSize: 18),
                );
              },
            ),
            Consumer<Billing>(
              builder: (context, billing, child) {
                return Text(
                  'Quantity Of Food : ${billing.foodProvider.quantity.toString()}',
                  style: const TextStyle(fontSize: 18),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<FoodProvider>(context, listen: false).updatePrice(
                    Provider.of<FoodProvider>(context, listen: false)
                            .foodPrice +
                        500,
                    Provider.of<FoodProvider>(context, listen: false).quantity +
                        2);
              },
              child: const Text('Increment'),
            ),
            Consumer<Billing>(
              builder: (context, billing, child) {
                return Text(
                  'Billing Amount : ${billing.billPrice()}',
                  style: const TextStyle(fontSize: 18),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
