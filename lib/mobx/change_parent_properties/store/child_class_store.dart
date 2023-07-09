import 'package:mobx/mobx.dart';
import 'package:practical_5/mobx/change_parent_properties/store/parent_class_store.dart';

part 'child_class_store.g.dart';

class ChildClassStore = _ChildClassStore with _$ChildClassStore;

abstract class _ChildClassStore extends ParentClassStore with Store {
  List<String> images = [
    'https://images.unsplash.com/photo-1674574124340-c00cc2dae99c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://plus.unsplash.com/premium_photo-1682088221085-a99b7aa535b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
    'https://plus.unsplash.com/premium_photo-1682795706948-970707507af6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1683641709248-6be047dfe319?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1N3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1519802772250-a52a9af0eacb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fEluZGlhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  ];
}
