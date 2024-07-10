import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

dataToFavorite(name, price, owner) async {
  final querySnapshot = await FirebaseFirestore.instance
      .collection("favourite")
      .where("name", isEqualTo: name)
      .where("owner", isEqualTo: owner)
      .where("favorite", isEqualTo: true)
      .get();

  if (querySnapshot.docs.isEmpty) {
    FirebaseFirestore.instance
        .collection("favourite")
        .doc("$name$owner")
        .set({"name": name, "price": price, "owner": owner, "favorite": true});
    Get.snackbar("DONE", "the item has been added to favourite",
        backgroundColor: Colors.white);
  } else {
    Get.snackbar("OK", "the item is already exists in the favourite",
        backgroundColor: Colors.white);
  }
}
