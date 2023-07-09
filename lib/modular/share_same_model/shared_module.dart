import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_5/modular/modular_routes.dart';
import 'package:practical_5/modular/share_same_model/same_module_home_page.dart';
import 'package:practical_5/modular/share_same_model/user_dependency.dart';

import 'get_user_email.dart';
import 'get_user_name.dart';
import 'get_user_phone_number.dart';

class UserModule extends Module {
  UserModule() {
    debugPrint('USER MODULE CREATED');
  }

  @override
  void dispose() {
    debugPrint('Module is Dispose');
    super.dispose();
  }

  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => GetUserDetails(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const SameModuleHomePage(),
        ),
        ChildRoute(
          ModularRoutes.getUserName,
          child: (context, args) => const GetUserName(),
        ),
        ChildRoute(
          ModularRoutes.getUserEmail,
          child: (context, args) => const GetUserEmail(),
        ),
        ChildRoute(
          ModularRoutes.getUserPhoneNumber,
          child: (context, args) => const GetUserPhoneNumber(),
        ),
        // ChildRoute(ModularRoutes.getUserName, child: child)
      ];
}
