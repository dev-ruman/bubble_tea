import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tea_shop/component/drink_tile.dart';
import 'package:tea_shop/models/drink.dart';
import 'package:tea_shop/models/tea_shop.dart';
import 'package:tea_shop/pages/order_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void onArrowClicked(Drink drink) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => OrderPage(
                  drink: drink,
                ))));
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
                    itemCount: value.shop.length,
                    itemBuilder: (context, index) {
                      Drink individualDrink = value.shop[index];
                      return GestureDetector(
                          onTap: () => onArrowClicked(individualDrink),
                          child: DrinkTile(
                            drink: individualDrink,
                            trailing: Icon(
                              Icons.arrow_forward,
                              color: Colors.brown[400],
                            ),
                          ));
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
