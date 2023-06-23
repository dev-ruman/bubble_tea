import 'package:flutter/material.dart';
import 'package:tea_shop/models/drink.dart';

class DrinkTile extends StatefulWidget {
  final Drink drink;
  final Widget trailing;
  DrinkTile({super.key, required this.drink, required this.trailing});

  @override
  State<DrinkTile> createState() => _DrinkTileState();
}

class _DrinkTileState extends State<DrinkTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Image.asset(
          widget.drink.imagePath,
        ),
        title: Text(widget.drink.name),
        subtitle: Text('\$ ${widget.drink.price}'),
        trailing: widget.trailing,
      ),
    );
  }
}
