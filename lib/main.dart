import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/firebase/login_or_homescreen.dart';
import 'app/material.dart';

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
