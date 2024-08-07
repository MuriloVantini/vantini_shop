import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:vantini_shop/src/components/search_bar.dart';
import 'package:vantini_shop/src/models/user_model.dart';
import 'package:vantini_shop/src/screens/home_page.dart';

class MyBottomNavbar extends StatefulWidget {
  final UserModel user;
  const MyBottomNavbar({super.key, required this.user});

  @override
  State<MyBottomNavbar> createState() => _MyBottomNavbarState();
}

class _MyBottomNavbarState extends State<MyBottomNavbar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List pages = [
      HomePage(user: widget.user),
      HomePage(user: widget.user),
      HomePage(user: widget.user),
      HomePage(user: widget.user),
    ];
    return Scaffold(
      appBar: AppBar(title: const MySearchBar()),
      body: pages[_selectedIndex],
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xff6200ee),
          unselectedItemColor: const Color(0xff757575),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: _navBarItems),
    );
  }
}

final _navBarItems = [
  SalomonBottomBarItem(
    icon: const Icon(Icons.home),
    title: const Text("Home"),
    selectedColor: Colors.purple,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.favorite_border),
    title: const Text("Likes"),
    selectedColor: Colors.pink,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.search),
    title: const Text("Search"),
    selectedColor: Colors.orange,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.person),
    title: const Text("Profile"),
    selectedColor: Colors.teal,
  ),
];
