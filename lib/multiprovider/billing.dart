import 'package:flutter/material.dart';

class FoodProvider extends ChangeNotifier {
  int foodPrice;
  int quantity;
  FoodProvider({this.foodPrice = 0, this.quantity = 0});

  void updatePrice(int newPrice, int qty) {
    foodPrice = newPrice;
    quantity = qty;
    notifyListeners();
  }
}

class Billing extends ChangeNotifier {
  final FoodProvider foodProvider;
  Billing(this.foodProvider);

  // int get billPrice {
  //   return (foodProvider.foodPrice * foodProvider.quantity);
  // }
  int billPrice() {
    return (foodProvider.foodPrice * foodProvider.quantity);
  }
}
