import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_5/modular/di_example.dart';
import 'package:practical_5/modular/report.dart';
import 'package:practical_5/modular/share_same_model/shared_module.dart';

import 'getdata_using_factory.dart';
import 'getdata_using_lazy_singleton.dart';
import 'getdata_using_singlton.dart';
import 'modular_routes.dart';

void main() =>
    runApp(ModularApp(module: AppModule(), child: const AppWidget()));

class TestModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => GetDataUsingSingleton(), export: true),
        Bind.factory((i) => GetDataUsingFactory(), export: true),
        Bind.lazySingleton((i) => GetDataUsingLazySingleton(), export: true),
        //Bind.lazySingleton((i) => GetUserDetails(), export: true),
        //Bind.instance(GetDataUsingSingleton()),
      ];
}

class AppModule extends Module {
  AppModule() {
    debugPrint('AppModule is Created');
  }

  @override
  List<TestModule> get imports => [
        TestModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const HomePage(),
        ),
        ChildRoute(
          ModularRoutes.secondPage,
          child: (context, args) => SecondPage(name: args.queryParams['name']!),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          ModularRoutes.bindExample,
          child: (context, args) => const DependencyInjectionExample(),
        ),
        ChildRoute(
          ModularRoutes.singletonPage,
          child: (context, args) => const GetDataUsingSingletonExample(),
        ),
        ChildRoute(
          ModularRoutes.factoryPage,
          child: (context, args) => const GetDataUsingFactoryExample(),
        ),
        ChildRoute(ModularRoutes.lazySingletonPage,
            child: (context, args) => const GetDataUsingLazySingletonExample()),
        ChildRoute(
          ModularRoutes.showReport,
          child: (context, args) => const ShowReport(),
        ),

        ModuleRoute(
          ModularRoutes.shareModel,
          module: UserModule(),
        ),
        // ModuleRoute(
        //   ModularRoutes.shareModel,
        //   module: UserModule(),
        // ),
        // WildcardRoute(child: (context, args) => const PageNotFound()),

        /// Redirect from bindExample to Lazy SingletonExample Page
        // RedirectRoute(ModularRoutes.bindExample,
        //     to: ModularRoutes.lazySingletonPage)
      ];
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Smart App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    ); //added by extension
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('This is initial page'),
            ),
            ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed(ModularRoutes.secondPage);
              },
              child: const Text('Navigate to another Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed(ModularRoutes.getData);
              },
              child: const Text('Get Data'),
            ),
            ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed(ModularRoutes.bindExample);
              },
              child: const Text('DI Example of Bind'),
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint(Modular.to.navigateHistory.elementAt(0).name);

                Modular.to.pushNamed(ModularRoutes.shareModel);
              },
              child: const Text('Share Same Model'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String? name;
  const SecondPage({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is initial page'),
            Text('Name is $name'),
            ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed('/getData');
              },
              child: const Text('Get Data'),
            )
          ],
        ),
      ),
    );
  }
}
