import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:new_prism/screens/student_screens/home_screen.dart';
import 'package:new_prism/screens/student_screens/test.dart';

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
          icon: 'assets/icons/home_fill.png',
          unselectedIcon: 'assets/icons/home.png',
          // selectedColor: const Color.fromARGB(255, 255, 255, 255),
          selectedColor: Theme.of(context).colorScheme.onSurface,
          unselectedColor: Theme.of(context).colorScheme.onSurface),
      CrystalNavigationBarItem(
          icon: 'assets/icons/events_fill.png',
          unselectedIcon: 'assets/icons/events.png',
          // selectedColor: const Color.fromARGB(255, 255, 255, 255),
          selectedColor: Theme.of(context).colorScheme.onSurface,
          unselectedColor: Theme.of(context).colorScheme.onSurface),
      CrystalNavigationBarItem(
          icon: 'assets/icons/book_fill.png',
          unselectedIcon: 'assets/icons/book.png',
          // selectedColor: Colors.white
          selectedColor: Theme.of(context).colorScheme.onSurface,
          unselectedColor: Theme.of(context).colorScheme.onSurface),
      CrystalNavigationBarItem(
          icon: 'assets/icons/setting_fill.png',
          unselectedIcon: 'assets/icons/setting.png',
          // selectedColor: Colors.white,
          selectedColor: Theme.of(context).colorScheme.onSurface,
          unselectedColor: Theme.of(context).colorScheme.onSurface),
    ];
    return Scaffold(
      extendBody: true,
      body: screens[_selectedTab],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: CrystalNavigationBar(
          currentIndex: _selectedTab,
          marginR: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          paddingR: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          height: 10,
          borderRadius: 18,
          indicatorColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Colors.white70,
          backgroundColor: Theme.of(context).colorScheme.surface,
          onTap: _handleIndexChanged,
          items: items,
        ),
      ),
    );
  }
}
