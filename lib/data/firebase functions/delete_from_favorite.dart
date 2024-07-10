import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


deleteFromFavorite(name, owner) {
  FirebaseFirestore.instance
      .collection("favourite")
      .doc("$name$owner")
      .delete();

  Get.snackbar("DONE", "the item has been deleted successfully",
      backgroundColor: Colors.white);
}
