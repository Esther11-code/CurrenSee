import 'package:flutter/material.dart';

class HomestaticRepo {
  static List<BottomNavModel> bottomNav = [
    const BottomNavModel(icon: Icons.currency_exchange, title: "Conversion"),
    const BottomNavModel(icon: Icons.trending_up_sharp, title: "Rates"),
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
