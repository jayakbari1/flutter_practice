import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_5/mobx/change_parent_properties/store/child_class_store.dart';
import 'package:practical_5/mobx/change_parent_properties/store/parent_class_store.dart';

class CommonModules extends Module {
  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => [
        Bind((i) => ParentClassStore(), export: true),
        Bind((i) => ChildClassStore(), export: true)
      ];
}

class ChildClassModule extends Module {
// TODO: implement imports
  List<Module> get imports => [CommonModules()];
}
