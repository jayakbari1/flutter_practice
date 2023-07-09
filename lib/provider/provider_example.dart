import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:practical_5/Provider/counter_notifier.dart';
import 'package:provider/provider.dart';

class ProviderExample extends StatelessWidget {
  const ProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Logger logger = Logger();

    final Counter _countProvider = Provider.of<Counter>(context);
    logger.d('Unused object called but Provider get value');
    print(Provider.of<Counter>(context).count.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('PROVIDER EXAMPLE'),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer(
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  // Provider.of<Counter>(context, listen: true).count.toString(),
                  //context.read<Counter>().count.toString(),
                  'counter0 is  ${context.read<Counter>().count.toString()}',
                  //value.count.toString()
                );
              },
            ),

            // Selector(
            //   builder: (context, value, child) => Text(
            //     'counter is  ${context.watch<Counter>().count.toString()}',
            //   ),
            //   selector: (context, Counter c) => c.counter,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('Increment called');
                    Provider.of<Counter>(context, listen: false)
                        .incrementCounter();
                  },
                  child: const Text('Increment'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('decrement called');
                    Provider.of<Counter>(context, listen: false)
                        .decrementCounter();
                  },
                  child: const Text('decrement'),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.of(context).push(
                //       MaterialPageRoute(
                //         builder: (context) => ChangeNotifierProvider<Counter>(
                //           create: (_) => Counter(),
                //           child: const ProviderScreen2(),
                //         ),
                //       ),
                //     );
                //   },
                //   child: const Text('Navigate to Screen2'),
                // ),
              ],
            ),
            /*const SizedBox(
              height: 10,
            ),
            // Consumer<Counter>(
            //   builder: (context, value, child) => Text(
            //     'counter1 is  ${context.watch<Counter>().count1.toString()}',
            //   ),
            // ),
            Selector(
              builder: (context, value, child) => Text(
                'counter1 is  ${context.watch<Counter>().count1.toString()}',
              ),
              selector: (context, Counter c) => c.counter1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("Increment1 called");
                    Provider.of<Counter>(context, listen: false)
                        .incrementCounter1();
                  },
                  child: const Text('Increment for Counter1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("decrement1 called");
                    Provider.of<Counter>(context, listen: false)
                        .decrementCounter1();
                  },
                  child: const Text('decrement for Counter1'),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.of(context).push(
                //       MaterialPageRoute(
                //         builder: (context) => ChangeNotifierProvider<Counter>(
                //           create: (_) => Counter(),
                //           child: const ProviderScreen2(),
                //         ),
                //       ),
                //     );
                //   },
                //   child: const Text('Navigate to Screen2'),
                // ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // Consumer<Counter>(
            //   builder: (context, value, child) => Text(
            //     'counter2 is  ${context.watch<Counter>().count2.toString()}',
            //   ),
            // ),
            Selector(
              builder: (context, value, child) => Text(
                'counter2 is  ${context.watch<Counter>().count2.toString()}',
              ),
              selector: (context, Counter c) => c.counter2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("Increment2 called");
                    Provider.of<Counter>(context, listen: false)
                        .incrementCounter2();
                  },
                  child: const Text('Increment for Counter2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("decrement2 called");
                    Provider.of<Counter>(context, listen: false)
                        .decrementCounter2();
                  },
                  child: const Text('decrement for Counter2'),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.of(context).push(
                //       MaterialPageRoute(
                //         builder: (context) => ChangeNotifierProvider<Counter>(
                //           create: (_) => Counter(),
                //           child: const ProviderScreen2(),
                //         ),
                //       ),
                //     );
                //   },
                //   child: const Text('Navigate to Screen2'),
                // ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Selector(
              builder: (context, value, child) => Text(
                'counter3 is  ${context.watch<Counter>().count3.toString()}',
              ),
              selector: (context, Counter c) => c.counter3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("Increment3 called");
                    Provider.of<Counter>(context, listen: false)
                        .incrementCounter3();
                  },
                  child: const Text('Increment for Counter3'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("decrement called");
                    Provider.of<Counter>(context, listen: false)
                        .decrementCounter3();
                  },
                  child: const Text('decrement3 for Counter 3'),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.of(context).push(
                //       MaterialPageRoute(
                //         builder: (context) => ChangeNotifierProvider<Counter>(
                //           create: (_) => Counter(),
                //           child: const ProviderScreen2(),
                //         ),
                //       ),
                //     );
                //   },
                //   child: const Text('Navigate to Screen2'),
                // ),
              ],
            ),*/
          ],
        ),
      ),
    );
  }
}
