import 'package:flutter/material.dart';

class HomestaticRepo {
  static List<BottomNavModel> bottomNav = [
    const BottomNavModel(icon: Icons.home, title: "Home"),
    const BottomNavModel(icon: Icons.favorite, title: "Favorite"),
    const BottomNavModel(icon: Icons.shopping_bag, title: "Cart"),
    const BottomNavModel(icon: Icons.person, title: "Profile"),
  ];
  static List<String> selectedTab = [
    'Login',
    'SignUp',
  ];
}

class BottomNavModel {
  final IconData? icon;
  final String? title;
  const BottomNavModel({
    this.icon,
    this.title,
  });
}
