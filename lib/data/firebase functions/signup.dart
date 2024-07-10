import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

signup(signupForm, signupEmail, signupPassword, signupUsername,
    signupPhone) async {
  try {
    if (signupForm.validate()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signupEmail,
        password: signupPassword,
      );
      FirebaseFirestore.instance.collection("users").add({
        "username": signupUsername,
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "email": signupEmail,
        "phone": signupPhone,
      });
      Get.snackbar("DONE", "You have been signed  successfully",
          backgroundColor: Colors.white);
      Get.offNamed("/homescreen");
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      Get.defaultDialog(
        title: "ERROR!",
        middleText: "The password provided is too weak.",
        backgroundColor: Colors.white,
      );
    } else if (e.code == 'email-already-in-use') {
      Get.defaultDialog(
        title: "ERROR!",
        middleText: "The account already exists for that email.",
        backgroundColor: Colors.white,
      );
    } else {
      Get.defaultDialog(
        title: "ERROR!",
        middleText: "invalid email or password",
        backgroundColor: Colors.white,
      );
    }
  }
}
