import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:vantini_shop/src/components/search_bar.dart';
import 'package:vantini_shop/src/models/user_model.dart';
import 'package:vantini_shop/src/screens/home_page.dart';
import 'package:vantini_shop/src/settings/settings_controller.dart';
import 'package:vantini_shop/src/settings/settings_view.dart';

class MyBottomNavbar extends StatefulWidget {
  final String token;
  final UserModel user;
  final SettingsController controller;
  const MyBottomNavbar({super.key, required this.user, required this.controller, required this.token});

  @override
  State<MyBottomNavbar> createState() => _MyBottomNavbarState();
}

class _MyBottomNavbarState extends State<MyBottomNavbar> {
  int _selectedIndex = 0;
  List pages = [];
  @override
  void initState() {
    pages = [
      HomePage(user: widget.user, token: widget.token,),
      HomePage(user: widget.user, token: widget.token,),
      HomePage(user: widget.user, token: widget.token,),
      SettingsView(controller: widget.controller),
    ];
    super.initState();
  }

  final navBarItems = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const MySearchBar()),
      body: pages[_selectedIndex],
      bottomNavigationBar: SalomonBottomBar(
          duration: const Duration(milliseconds: 200),
          currentIndex: _selectedIndex,
          itemShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          curve: Curves.easeInToLinear,
          selectedItemColor: const Color(0xff6200ee),
          unselectedItemColor: const Color(0xff757575),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: navBarItems),
    );
  }
}
