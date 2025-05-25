import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:equina_task/app/home_cycle/views/home_screen.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.calendar_month, title: 'Calendwe'),
          TabItem(icon: Icons.map, title: 'Maps'),
          TabItem(icon: IconData(0xe800, fontFamily: "HelmetIcon", fontPackage: null), title: 'livery'),
          TabItem(icon: Icons.shopping_cart, title: 'Cart'),
        ],
        color: black,
        backgroundColor: white,
        activeColor: mainBlue,
        onTap: (int i) {
          currentIndex = i;
          setState(() {});
        },
      ),
    );
  }
}

List<Widget> tabs = [
  HomeScreen(),
  Center(child: Text('Calender')),
  Center(child: Text('Maps')),
  Center(child: Text('livery')),
  Center(child: Text('Cart')),
];
