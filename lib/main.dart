import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tea_shop/models/tea_shop.dart';
import 'package:tea_shop/pages/layout_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TeaShop(),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.brown,
          ),
          home: LayoutPage(),
        );
      },
    );
  }
}
