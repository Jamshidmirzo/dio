import 'package:flutter/material.dart';
import 'package:lesson81/ui/screens/dioProductsScreen.dart';
import 'package:lesson81/ui/screens/register_screen.dart';
import 'package:lesson81/ui/screens/users_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dioproductsscreen(),
    );
  }
}
