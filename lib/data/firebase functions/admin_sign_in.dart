import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/view/modules%20view/admin/screens/admin.dart';

bool complete = false;
Future<dynamic> adminSignIn(key) async {
  var key2 = "admin123";
  if (key == key2) {
    Get.offAll(const ADMIN());
    Get.snackbar("Done", "You are logged in as an admin",
        backgroundColor: Colors.white);
  } else {
    Get.snackbar("failed", "not allowed", backgroundColor: Colors.white);
  }
}
