import 'package:flutter/material.dart';
import 'package:tea_shop/component/bottom_navBar.dart';

import 'cart_page.dart';
import 'home_page.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int selectedIndex = 0;
  void onMenuChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> _pages = [HomePage(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      extendBody: true,
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onMenuChanged: onMenuChanged,
      ),
    );
  }
}
