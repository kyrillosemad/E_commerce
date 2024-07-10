import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/firebase%20functions/login_or_homescreen.dart';
import 'package:restaurant_app/view/modules%20view/admin/screens/admin.dart';
import 'package:restaurant_app/view/modules%20view/admin/screens/admin_login.dart';
import 'package:restaurant_app/view/modules%20view/auth/screens/login.dart';
import 'package:restaurant_app/view/modules%20view/auth/screens/sign_up.dart';
import 'package:restaurant_app/view/modules%20view/cart/screens/cart.dart';
import 'package:restaurant_app/view/modules%20view/favorite/screens/favourite.dart';
import 'package:restaurant_app/view/modules%20view/homescreen/screens/home_screen.dart';
import 'package:restaurant_app/view/modules%20view/item/screens/item.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

bool islogin = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyDmBCtzvKFjz-Q603GmRwhsdvzwt7-SQpE",
            appId: "1:494755325367:android:496af6ce4dbb7a47d2b432",
            messagingSenderId: "494755325367",
            projectId: "restaurant-app-f787b",
          ),
        )
      : await Firebase.initializeApp();
  if (getuser()) {
    islogin = true;
  } else {
    islogin = false;
  }
  return runApp(const RESTAURANT());
}

class RESTAURANT extends StatelessWidget {
  const RESTAURANT({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: islogin ? const HOMESCREEN() : const LOGIN(),
        getPages: [
          GetPage(
              name: "/homescreen",
              page: () {
                return const HOMESCREEN();
              }),
          GetPage(
              name: "/login",
              page: () {
                return const LOGIN();
              }),
          GetPage(
              name: "/signup",
              page: () {
                return const SIGNUP();
              }),
          GetPage(
              name: "/cart",
              page: () {
                return const CART();
              }),
          GetPage(
              name: "/favourite",
              page: () {
                return const FAVOURITE();
              }),
          GetPage(
              name: "/item",
              page: () {
                return const ITEM();
              }),
          GetPage(
              name: "/admin",
              page: () {
                return const ADMIN();
              }),
          GetPage(
              name: "/admin_login",
              page: () {
                return const ADMINLOGIN();
              }),
        ],
      );
    });
  }
}
