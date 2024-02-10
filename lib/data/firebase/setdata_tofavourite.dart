import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

data_tofavourite(name, price, owner) async {
  final querySnapshot = await FirebaseFirestore.instance
      .collection("favourite")
      .where("name", isEqualTo: name)
      .where("owner", isEqualTo: owner)
      .get();

  if (querySnapshot.docs.isEmpty) {
    FirebaseFirestore.instance
        .collection("favourite")
        .add({"name": name, "price": price, "owner": owner});
    Get.snackbar("DONE", "the item has been added to favourite",
        backgroundColor: Colors.white);
  } else {
    Get.snackbar("OK", "the item is already exists in the favourite",
        backgroundColor: Colors.white);
  }
}
