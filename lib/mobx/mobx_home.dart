import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:practical_5/mobx/store/mobx_counter_code_generation.dart';

class MobXHome extends StatelessWidget {
  MobXHome({Key? key}) : super(key: key);

  //static final Counter counter = Counter();

  @override
  Widget build(BuildContext context) {
    final mobXCodeGeneration = MobXCodeGeneration();
    return Scaffold(
      appBar: AppBar(
        title: const Text('MobX HomePage'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (context) {
                return Text(
                  //'Your Counter is :: ${counter.counterValue}',
                  'Your Counter is :: ${mobXCodeGeneration.counter}',
                  style: const TextStyle(fontSize: 25),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 80,
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    //onPressed: counter.increment,
                    onPressed: mobXCodeGeneration.increment,
                    label: const Text(
                      '+',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: mobXCodeGeneration.decrement,
                    label: const Text(
                      '-',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.lock_reset,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: mobXCodeGeneration.reset,
              label: const Text(
                'Reset Counter',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
