import 'package:flutter/material.dart' as mat;
import 'package:mobx/mobx.dart';

class CounterBill {
  final mat.BuildContext context;
  ReactionDisposer? reactionForSnackBar;
  CounterBill(this.context) {
    incrementBurgerPrize = Action(_incrementBurgerPrize);
    decrementBurgerPrize = Action(_decrementBurgerPrize);
    incrementPizzaPrize = Action(_incrementPizzaPrize);
    decrementPizzaPrize = Action(_decrementPizzaPrize);
    reset = Action(_resetPrize);

    reactionForSnackBar = reaction((p0) {
      if (burgerPrize.isNegative || pizzaPrize.isNegative) {
        return true;
      } else {
        return false;
      }
    }, (p0) {
      if (p0) {
        mat.SnackBar snackBar =
            const mat.SnackBar(content: mat.Text('Can\'t set negative value'));
        mat.ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        print("\n\nREACTION CALLED\n\n");
      }
    });
  }

  ObservableList list = [].asObservable();

  final _burgerPrize = Observable(0.0);
  final _pizzaPrize = Observable(0.0);
  final _totalBurger = Observable(0);
  final _totalPizza = Observable(0);

  late final _totalBill = Computed(() {
    return (burgerPrize + pizzaPrize);
  });

  double get burgerPrize => _burgerPrize.value;

  set burgerPrize(double newValue) {
    _burgerPrize.value = newValue;
  }

  int get totalBurger => _totalBurger.value;

  set totalBurger(int newValue) {
    _totalBurger.value = newValue;
  }

  int get totalPizza => _totalPizza.value;

  set totalPizza(int newValue) {
    _totalPizza.value = newValue;
  }

  double get pizzaPrize => _pizzaPrize.value;

  set pizzaPrize(double newValue) {
    _pizzaPrize.value = newValue;
  }

  double get totalBill => _totalBill.value;

  late Action incrementBurgerPrize;
  late Action decrementBurgerPrize;
  late Action incrementPizzaPrize;
  late Action decrementPizzaPrize;
  late Action countTotalBill;
  late Action reset;

  void _incrementBurgerPrize() {
    burgerPrize = burgerPrize + 50;
    totalBurger++;
  }

  void _decrementBurgerPrize() {
    burgerPrize = burgerPrize - 50;
    totalBurger--;
  }

  void _incrementPizzaPrize() {
    pizzaPrize = pizzaPrize + 50;
    totalPizza++;
  }

  void _decrementPizzaPrize() {
    pizzaPrize = pizzaPrize - 50;
    totalPizza--;
  }

  void _resetPrize() {
    burgerPrize = 0;
    pizzaPrize = 0;
    totalPizza = 0;
    totalBurger = 0;
  }
}
