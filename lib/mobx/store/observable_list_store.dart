import 'package:mobx/mobx.dart';

part 'observable_list_store.g.dart';

class ObservableListExample = _ObservableListExample
    with _$ObservableListExample;

abstract class _ObservableListExample with Store {
  _ObservableListExample() {
    when((p0) => listOfInteger.isNotEmpty, () {
      if (listOfInteger.isNotEmpty) {
        listOfInteger.removeAt(0);
        listOfInteger.insert(0, 1000);
      }
    });
  }

  List<int> list = [0];

  ObservableList<int> listOfInteger = ObservableList<int>.of([0]);

  @observable
  int count = 0;

  void addElement() {
    list.add(count);
  }

  void newAssignment(List<int> i) {
    list = i;
  }

  void deleteElement() {
    list.removeAt(count);
  }

  void insertElement() {
    listOfInteger.insert(++count, count);
  }

  void removeElement() {
    listOfInteger.removeAt(0);
    count--;
  }
}
