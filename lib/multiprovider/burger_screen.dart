import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'all_provider.dart';

class BurgerScreen extends StatefulWidget {
  const BurgerScreen({Key? key}) : super(key: key);

  @override
  State<BurgerScreen> createState() => _BurgerScreenState();
}

class _BurgerScreenState extends State<BurgerScreen> {
  @override
  void didChangeDependencies() {
    print('Did Change Dependencies Called');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant BurgerScreen oldWidget) {
    print('Did Update Widget Called');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('Dispose Called');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Burger'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer3<Burger, Pizza, Bill>(
              builder: (context, burger, pizza, bill, child) {
                return Column(
                  children: [
                    Text('Burger Price is : ${burger.burgerPrice.toString()}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            burger.updateBurgerPrice(burger.burgerPrice + 50);
                          },
                          child: const Text(
                            'Add Burger',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            burger.updateBurgerPrice(burger.burgerPrice - 50);
                          },
                          child: const Text(
                            'Remove Burger',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Pizza Price is : ${pizza.pizzaPrice.toString()}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            pizza.updatePizzaPrice(pizza.pizzaPrice + 50);
                          },
                          child: const Text(
                            'Add Pizza',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            pizza.updatePizzaPrice(pizza.pizzaPrice - 50);
                          },
                          child: const Text(
                            'Remove Pizza',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Your Total Bill is : ${bill.billAmount.toString()}'),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
