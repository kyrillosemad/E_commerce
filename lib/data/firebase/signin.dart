import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

signin(login_form, login_email, login_passowrd) async {
  try {
    if (login_form.validate()) {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: login_email, password: login_passowrd);
      Get.snackbar("DONE", "You have been logged in successfully",backgroundColor:Colors.white );
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
