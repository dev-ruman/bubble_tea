import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tea_shop/models/drink.dart';
import 'package:tea_shop/models/tea_shop.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({super.key, required this.drink});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  double sugarValue = 0.25;
  double pearlValue = 0.5;
  double iceValue = 0.5;
  customizeSugar(value) {
    setState(() {
      sugarValue = value;
    });
  }

  customizePearl(value) {
    setState(() {
      pearlValue = value;
    });
  }

  customizeIce(value) {
    setState(() {
      iceValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    addToCart() {
      Provider.of<TeaShop>(context, listen: false).addToCart(widget.drink);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Succesfully added to cart'),
        behavior: SnackBarBehavior.floating,
      ));
      print(widget.drink.name);
    }

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        title: Text(widget.drink.name),
        elevation: 0,
      ),
      body: Column(children: [
        Container(
            margin: EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
                child: Image.asset(
              widget.drink.imagePath,
              fit: BoxFit.cover,
              width: width * 0.6,
            ))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    child: const Text(
                      'Sugar',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Slider(
                        value: sugarValue,
                        label: sugarValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizeSugar(value)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    child: const Text(
                      'Pearl',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Slider(
                        value: pearlValue,
                        label: pearlValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizePearl(value)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    child: const Text(
                      'Ice',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Slider(
                        value: iceValue,
                        label: iceValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizeIce(value)),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
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
                      'Add to cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  color: Colors.brown,
                  onPressed: addToCart),
            )),
          ],
        )
      ]),
    );
  }
}
