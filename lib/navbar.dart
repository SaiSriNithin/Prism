import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:new_prism/home_screen.dart';
import 'package:new_prism/test.dart';

class Navbar1 extends StatefulWidget {
  const Navbar1({super.key});

  @override
  State<Navbar1> createState() => _Navbar1State();
}

class _Navbar1State extends State<Navbar1> {
  int _selectedTab = 0;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = i;
    });
  }

  final screens = [
    const Homescreen(),
    const Test(),
    const Test(),
    const Test()
  ];

  @override
  Widget build(BuildContext context) {
    final items = [
      CrystalNavigationBarItem(
        icon: IconlyBold.home,
        unselectedIcon: IconlyLight.home,
        selectedColor: Colors.white,
      ),
      CrystalNavigationBarItem(
        icon: Icons.shopping_cart,
        unselectedIcon: Icons.shopping_cart_outlined,
        selectedColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      CrystalNavigationBarItem(
          icon: IconlyBold.paper_plus,
          unselectedIcon: IconlyLight.search,
          selectedColor: Colors.white),
      CrystalNavigationBarItem(
        icon: IconlyBold.user_2,
        unselectedIcon: IconlyLight.user,
        selectedColor: Colors.white,
      ),
    ];
    return Scaffold(
      extendBody: true,
      body: screens[_selectedTab],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CrystalNavigationBar(
          currentIndex: _selectedTab,
          itemPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          height: 10,

          //indicatorColor: Colors.blue,
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.black.withOpacity(0.5),
          onTap: _handleIndexChanged,
          items: items,
        ),
      ),
    );
  }
}