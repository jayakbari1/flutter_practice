import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_5/mobx/change_parent_properties/modular/child_class_modul.dart';
import 'package:practical_5/mobx/change_parent_properties/modular/modular_child_class.dart';
import 'package:practical_5/mobx/select_mobx.dart';
import 'package:practical_5/network/dio/dio_methods.dart';
import 'package:practical_5/network/network_home_page.dart';
import 'package:practical_5/network/retrofit/retrofit_methods.dart';
import 'package:practical_5/route/routes.dart';

import '../network/tmdb/tmdb_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.mobxExample:
        return MaterialPageRoute(
          builder: (context) => const SelectMobXTopic(),
        );
      case Routes.modularRoutes:
        return MaterialPageRoute(
          builder: (_) => ModularApp(
            module: ChildClassModule(),
            notAllowedParentBinds: true,
            child: const ModularChildClass(),
          ),
        );
      case Routes.networkHomePage:
        return MaterialPageRoute(
          builder: (_) => const NetworkHomePage(),
        );
      // case Routes.httpPage:
      //   return MaterialPageRoute(
      //     builder: (_) => const HttpMethods(),
      //   );
      case Routes.dioPage:
        return MaterialPageRoute(
          builder: (_) => const DioMethods(),
        );
      case Routes.tmdbPage:
        return MaterialPageRoute(
          builder: (_) => const TMDBPage(),
        );
      case Routes.retrofitPage:
        return MaterialPageRoute(
          builder: (_) => const RetrofitMethods(),
        );

      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Error',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: const Center(
            child: Text('No Routes Found'),
          ),
        );
      },
    );
  }
}
