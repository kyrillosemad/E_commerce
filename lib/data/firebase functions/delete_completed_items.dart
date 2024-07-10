// ignore_for_file: avoid_types_as_parameter_names

import 'package:cloud_firestore/cloud_firestore.dart';

completeCartItem(name, price, totalPrice, owner, count, phone, uid) {
  FirebaseFirestore.instance
      .collection("cart")
      .doc("$name$price$totalPrice$owner$count$phone$uid")
      .delete();
}
