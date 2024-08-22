import 'package:ecommerceapp/view/cart_screen.dart';
import 'package:ecommerceapp/view/home_screen.dart';
import 'package:ecommerceapp/view/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentindex = 0;
  List screens = [
    const HomeScreen(),
    const CartScreen(),
    ProfileScreen( ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentindex],
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          elevation: 1,
          currentIndex: currentindex,
          onTap: (newindex) {
            setState(() {
              currentindex = newindex;
            });
          },
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.black,
          backgroundColor: Color(0xFBc2b280),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.store), label: 'cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
          ]),
    );
  }
}
