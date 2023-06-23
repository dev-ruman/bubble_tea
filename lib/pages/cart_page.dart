import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../component/drink_tile.dart';
import '../models/drink.dart';
import '../models/tea_shop.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Drink drink) {
    Provider.of<TeaShop>(context, listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TeaShop>(
      builder: (context, value, child) {
        return SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            child: Column(
              children: [
                Text(
                  'Available Drinks',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.cart.length,
                    itemBuilder: (context, index) {
                      Drink drink = value.cart[index];
                      return DrinkTile(
                          drink: drink,
                          trailing: IconButton(
                              onPressed: () => removeFromCart(drink),
                              icon: Icon(
                                Icons.delete,
                                color: Colors.brown,
                              )));
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: MaterialButton(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              'Pay Now',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          color: Colors.brown,
                          onPressed: () {}),
                    )),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
