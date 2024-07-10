// ignore_for_file: avoid_types_as_parameter_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


deleteFromCart(name, price, totalPrice, owner, count, phone, uid) {
  FirebaseFirestore.instance
      .collection("cart")
      .doc("$name$price$totalPrice$owner$count$phone$uid")
      .delete();
  Get.snackbar("DONE", "the item has been deleted successfully",
      backgroundColor: Colors.white);
}
