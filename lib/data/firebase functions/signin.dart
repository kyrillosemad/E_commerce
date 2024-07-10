import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

signIn(loginForm, loginEmail, loginPassword) async {
  try {
    if (loginForm.validate()) {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginEmail, password: loginPassword);
      Get.snackbar("DONE", "You have been logged in successfully",
          backgroundColor: Colors.white);
      Get.offAllNamed("/homescreen");
    }
  } on FirebaseAuthException {
    Get.defaultDialog(
      title: "ERROR!",
      middleText: "Email or password is wrong",
      backgroundColor: Colors.white,
    );
  }
}
