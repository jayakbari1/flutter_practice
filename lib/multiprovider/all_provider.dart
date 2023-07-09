import 'package:flutter/material.dart';

class Burger extends ChangeNotifier {
  int burgerPrice;

  Burger({this.burgerPrice = 0});

  void updateBurgerPrice(int newBurgerPrice) {
    burgerPrice = newBurgerPrice;
    notifyListeners();
  }
}

class Pizza extends ChangeNotifier {
  int pizzaPrice;

  Pizza({this.pizzaPrice = 0});

  void updatePizzaPrice(int newPizzaPrice) {
    pizzaPrice = newPizzaPrice;
    notifyListeners();
  }
}

class Bill extends ChangeNotifier {
  final Pizza pizza;
  final Burger burger;
  Bill(this.burger, this.pizza);

  int get billAmount {
    return (pizza.pizzaPrice + burger.burgerPrice);
  }
}
