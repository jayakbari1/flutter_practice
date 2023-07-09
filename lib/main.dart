import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:practical_5/route/navigator_service.dart';
import 'package:practical_5/route/route_generator.dart';
import 'package:practical_5/route/routes.dart';

void main() {
  // TODO: implement main
  print('Main is Called');
  runApp(MyApp());
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  Logger logger = Logger();

  @override
  State<MyApp> createState() {
    //  logger.wtf('New Instance is created');
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // if (const bool.fromEnvironment('dart.vm.product')) {
    //   debugPrint('In Release mode');
    // } else if (const bool.fromEnvironment('dart.vm.profile')) {
    //   debugPrint('Profile');
    // } else {
    //   debugPrint('In Debug Mode');
    // }

    ///For Go Router
    // return MaterialApp.router(
    //   // routeInformationParser:
    //   //     NyAppRouter.returnRouter(false).routeInformationParser,
    //   // routerDelegate: NyAppRouter.returnRouter(false).routerDelegate,
    //   routerConfig: NyAppRouter.returnRouter(false),
    //   theme: ThemeData(
    //     useMaterial3: true,
    //   ),
    // );

    ///For Route Observer
    // return MaterialApp(
    //   theme: ThemeData(
    //     useMaterial3: true,
    //   ),
    //   navigatorObservers: [routeObserver],
    //   home: const Screen1(),
    //   routes: {
    //     'screen2': (context) => const Screen2(),
    //     'screen3': (context) => const Screen3(),
    //   },
    // );

    //For Provider
    /// Provider solve the problem related to InheritadeWidget and make
    /// functions and variable globally accessible and MaterialApp is remain
    /// throughout the App that's why we need ro wrap Provider with MaterialApp.
    // print("Lazy is Called");
    // return ChangeNotifierProvider(
    //   create: (context) => Counter(),
    //   builder: (context, child) {
    //     return MaterialApp(
    //       theme: ThemeData(
    //         useMaterial3: true,
    //       ),
    //       home: const ProviderExample(),
    //     );
    //   },
    //   //create: (_) => Counter(),
    //   //lazy: true,
    // );

    //   logger.i("Create BLoc Object by Build Method");
    //   return MultiBlocProvider(
    //     providers: [
    //       BlocProvider(create: (context) {
    //         logger.wtf("Before CounterCubit0 Called");
    //         return CounterCubit0();
    //         logger.wtf("After CoutnerCubit0 Called now Build again");
    //       }),
    //       BlocProvider(
    //         create: (context) {
    //           logger.wtf("Before CounterCubit1 Called");
    //           return CounterCubit1();
    //         },
    //       ),
    //       BlocProvider(
    //         create: (context) => CounterCubit2(),
    //       ),
    //       BlocProvider(
    //         create: (context) => CounterCubit3(),
    //       ),
    //     ],
    //     child: MaterialApp(
    //       home: const CubitCounterExample(),
    //       theme: ThemeData(
    //         useMaterial3: true,
    //       ),
    //     ),
    //   );
    // }

    // return BlocProvider(
    //   create: (context) {
    //     logger.e("Bloc Counter Initialize");
    //     return BlocCounter();
    //   },
    //   child: MaterialApp(
    //     home: const BlocCounterUI(),
    //     theme: ThemeData(
    //       useMaterial3: true,
    //     ),
    //   ),
    // );

    // return MaterialApp(
    //   home: Provider(
    //     create: (context) => HandleIndicator(context),
    //     child: const ShowAlertDialogAndShowIndicator(),
    //   ),
    // );

    // return MaterialApp(
    //   home: ArticleDetailScreen(),
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.networkHomePage,
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: NavigationService().navigationKey,
    );

    // return const MaterialApp(
    //   home: FlexibleClass(),
    // );
  }
}
