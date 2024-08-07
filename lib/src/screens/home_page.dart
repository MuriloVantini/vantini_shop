import 'package:flutter/material.dart';
import 'package:vantini_shop/src/models/user_model.dart';

class HomePage extends StatefulWidget {
  final UserModel user; 
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
