import 'package:flutter/material.dart';
import 'package:tea_shop/models/drink.dart';

class TeaShop extends ChangeNotifier {
  List<Drink> _shop = [
    Drink(name: 'Coffee', price: '5', imagePath: 'lib/asset/images/coffee.jpg'),
    Drink(
        name: 'Green Tea',
        price: '7',
        imagePath: 'lib/asset/images/green_tea.jpg'),
    Drink(
        name: 'Milk Shake',
        price: '6',
        imagePath: 'lib/asset/images/milkshake.jpg'),
    Drink(
        name: 'Strawberry Milkshake',
        price: '8',
        imagePath: 'lib/asset/images/strawberry_milkshake.jpg'),
    Drink(
        name: 'Strawberry Shake',
        price: '6',
        imagePath: 'lib/asset/images/strawberry_shake.jpg'),
  ];

  List<Drink> _userCart = [];

  List<Drink> get shop => _shop;

  List<Drink> get cart => _userCart;

  void addToCart(Drink drink) {
    _userCart.add(drink);
    notifyListeners();
  }

  void removeFromCart(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}
