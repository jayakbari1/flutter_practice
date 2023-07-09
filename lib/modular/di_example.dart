import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_5/modular/modular_routes.dart';

class DependencyInjectionExample extends StatelessWidget {
  const DependencyInjectionExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DI Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  debugPrint(Modular.to.navigateHistory.first.child.toString());
                  Modular.to.pushNamed(ModularRoutes.singletonPage);
                },
                child: const Text('Singleton Bind')),
            ElevatedButton(
                onPressed: () {
                  debugPrint(Modular.to.navigateHistory.first.child.toString());
                  Modular.to.pushNamed(ModularRoutes.factoryPage);
                },
                child: const Text('Factory Bind')),
            ElevatedButton(
                onPressed: () {
                  debugPrint(Modular.to.navigateHistory.first.child.toString());
                  Modular.to.pushNamed(ModularRoutes.lazySingletonPage);
                },
                child: const Text('Lazy Singleton Bind')),
            ElevatedButton(
                onPressed: () {
                  debugPrint(Modular.to.navigateHistory.first.child.toString());
                  Modular.to.pushNamed(ModularRoutes.showReport);
                },
                child: const Text('Show Report')),
          ],
        ),
      ),
    );
  }
}
