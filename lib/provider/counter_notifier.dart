import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int count;

  int count1;
  int count2;
  int count3;

  Counter({
    this.count = 0,
    this.count1 = 0,
    this.count2 = 0,
    this.count3 = 0,
  });

  int get counter => count;
  int get counter1 => count1;
  int get counter2 => count2;
  int get counter3 => count3;

  void incrementCounter() {
    count++;

    notifyListeners();
  }

  void decrementCounter() {
    count--;

    notifyListeners();
  }

  void incrementCounter1() {
    count1++;

    notifyListeners();
  }

  void decrementCounter1() {
    count1--;

    notifyListeners();
  }

  void incrementCounter2() {
    count2++;
    notifyListeners();
  }

  void decrementCounter2() {
    count2--;

    notifyListeners();
  }

  void incrementCounter3() {
    count3++;
    notifyListeners();
  }

  void decrementCounter3() {
    count3--;
    notifyListeners();
  }
}
