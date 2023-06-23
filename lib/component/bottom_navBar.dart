import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int)? onMenuChanged;
  const BottomNavBar(
      {super.key, required this.selectedIndex, required this.onMenuChanged});

  @override
  Widget build(BuildContext context) {
    return DotNavigationBar(
      currentIndex: selectedIndex,
      onTap: onMenuChanged,
      items: [
        DotNavigationBarItem(icon: Icon(Icons.home)),
        DotNavigationBarItem(icon: Icon(Icons.shopping_bag)),
      ],
      selectedItemColor: Colors.grey[800],
      unselectedItemColor: Colors.grey[500],
      dotIndicatorColor: Colors.transparent,
      enablePaddingAnimation: false,
      itemPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      paddingR: EdgeInsets.all(0),
      marginR: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
    );
  }
}
