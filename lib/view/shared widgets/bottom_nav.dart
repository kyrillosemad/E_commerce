// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/view/modules%20view/cart/screens/cart.dart';
import 'package:restaurant_app/view/modules%20view/favorite/screens/favourite.dart';
import 'package:sizer/sizer.dart';

class BottomNavPart extends StatefulWidget {
  final scaffoldKey;
  const BottomNavPart({super.key, required this.scaffoldKey});

  @override
  State<BottomNavPart> createState() => _BottomNavPartState();
}

class _BottomNavPartState extends State<BottomNavPart> {
  int item = 0;
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: 0,
      height: 6.h,
      items: const <Widget>[
        Icon(Icons.favorite, size: 30),
        Icon(Icons.add_shopping_cart, size: 30),
        Icon(Icons.perm_identity, size: 30),
      ],
      color: Colors.white,
      buttonBackgroundColor: Colors.white,
      backgroundColor: const Color.fromARGB(255, 245, 168, 37),
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 600),
      onTap: (index) async {
        setState(() {
          item = index;
        });
        if (item == 0) {
          await Future.delayed(const Duration(milliseconds: 650));
          Get.to(const FAVOURITE());
        }
        if (item == 1) {
          await Future.delayed(const Duration(milliseconds: 650));
          Get.to(const CART());
        }
        if (item == 2) {
          await Future.delayed(const Duration(milliseconds: 650));
          widget.scaffoldKey.currentState!.openDrawer();
        }
      },
      letIndexChange: (index) => true,
    );
  }
}
