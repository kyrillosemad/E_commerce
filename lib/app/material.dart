import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/main.dart';
import 'package:restaurant_app/presentation/admin.dart';
import 'package:restaurant_app/presentation/admin_login.dart';
import 'package:restaurant_app/presentation/cart.dart';
import 'package:restaurant_app/presentation/favourite.dart';
import 'package:restaurant_app/presentation/item.dart';
import 'package:restaurant_app/presentation/login.dart';
import 'package:restaurant_app/presentation/sign_up.dart';
import 'package:sizer/sizer.dart';
import 'package:restaurant_app/presentation/home_screen.dart';

class RESTAURANT extends StatefulWidget {
  const RESTAURANT({super.key});

  @override
  State<RESTAURANT> createState() => _RESTAURANTState();
}

class _RESTAURANTState extends State<RESTAURANT> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: islogin ? HOMESCREEN() : LOGIN(),
        getPages: [
          GetPage(
              name: "/homescreen",
              page: () {
                return HOMESCREEN();
              }),
          GetPage(
              name: "/login",
              page: () {
                return LOGIN();
              }),
          GetPage(
              name: "/signup",
              page: () {
                return SIGNUP();
              }),
          GetPage(
              name: "/cart",
              page: () {
                return CART();
              }),
          GetPage(
              name: "/favourite",
              page: () {
                return FAVOURITE();
              }),
          GetPage(
              name: "/item",
              page: () {
                return ITEM();
              }),
          GetPage(
              name: "/admin",
              page: () {
                return ADMIN();
              }),
          GetPage(
              name: "/admin_login",
              page: () {
                return ADMINLOGIN();
              }),
        ],
      );
    });
  }
}
