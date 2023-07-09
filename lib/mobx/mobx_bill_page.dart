import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:practical_5/mobx/store/count_bill.dart';

class MobXCountBill extends StatelessWidget {
  const MobXCountBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterBill = CounterBill(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Bill'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (context) => Text(
                //'Your Counter is :: ${counter.counterValue}',
                'Your Total Bill is :: ${counterBill.totalBill}',
                style: const TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Observer(
              builder: (context) => Text(
                //'Your Counter is :: ${counter.counterValue}',
                'Burger Prize is :: ${counterBill.burgerPrize}',
                style: const TextStyle(fontSize: 25),
              ),
            ),
            Observer(
              builder: (context) => Text(
                //'Your Counter is :: ${counter.counterValue}',
                'Total Burger :: ${counterBill.totalBurger}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            ReactionBuilder(
              builder: (context) {
                return counterBill.reactionForSnackBar!;
              },
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                //onPressed: counter.increment,
                onPressed: counterBill.decrementBurgerPrize,
                label: const Text(
                  'Burger Prize',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    //onPressed: counter.increment,
                    onPressed: counterBill.incrementBurgerPrize,
                    label: const Text(
                      'Burger Prize',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: counterBill.decrementBurgerPrize,
                    label: const Text(
                      'Burger Prize',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Observer(
              builder: (context) => Text(
                //'Your Counter is :: ${counter.counterValue}',
                'Burger Prize is :: ${counterBill.pizzaPrize}',
                style: const TextStyle(fontSize: 25),
              ),
            ),
            Observer(
              builder: (context) => Text(
                //'Your Counter is :: ${counter.counterValue}',
                'Total Pizza :: ${counterBill.totalPizza}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    //onPressed: counter.increment,
                    onPressed: counterBill.incrementPizzaPrize,
                    label: const Text(
                      'Pizza Prize',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: counterBill.decrementPizzaPrize,
                    label: const Text(
                      'Pizza Prize',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: counterBill.reset,
              label: const Text(
                'Cancel Order',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
