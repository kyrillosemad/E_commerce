import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/data/firebase%20functions/signup.dart';
import 'package:restaurant_app/data/firebase%20functions/with_google.dart';
import 'package:sizer/sizer.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey signupForm;
  final TextEditingController signupPassword;
  final TextEditingController signupEmail;
  final TextEditingController signupUsername;
  final TextEditingController signupPhone;
  const SignUpForm(
      {super.key,
      required this.signupEmail,
      required this.signupForm,
      required this.signupPassword,
      required this.signupPhone,
      required this.signupUsername});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: signupForm,
        child: Column(
          children: [
            TextFormField(
              validator: (val) {
                if (val!.length < 4) {
                  return "invalid username, must be greater than 10";
                }
                return null;
              },
              controller: signupUsername,
              style: TextStyle(fontSize: 12.sp),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  label: Text(
                    "User name",
                    style: TextStyle(fontSize: 12.sp),
                  )),
            ),
            TextFormField(
              validator: (val) {
                if (val!.length < 10) {
                  return "invalid Email, must be greater than 10";
                }
                return null;
              },
              controller: signupEmail,
              style: TextStyle(fontSize: 12.sp),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  label: Text(
                    "Email",
                    style: TextStyle(fontSize: 12.sp),
                  )),
            ),
            TextFormField(
              validator: (val) {
                if (val!.length < 11) {
                  return "invalid phone number";
                }
                return null;
              },
              controller: signupPhone,
              style: TextStyle(fontSize: 12.sp),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone),
                  label: Text(
                    "phone",
                    style: TextStyle(fontSize: 12.sp),
                  )),
            ),
            TextFormField(
              validator: (val) {
                if (val!.length < 8) {
                  return "weak password";
                }
                return null;
              },
              controller: signupPassword,
              style: TextStyle(fontSize: 12.sp),
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.password),
                label: Text(
                  "Password",
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            MaterialButton(
              onPressed: () {
                signup(
                  signupForm.currentState,
                  signupEmail.text,
                  signupPassword.text,
                  signupUsername.text,
                  signupPhone.text,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 168, 37),
                    borderRadius: BorderRadius.circular(10.sp)),
                height: 6.h,
                child: Center(
                  child: Text(
                    "SIGN UP ",
                    style: TextStyle(fontSize: 15.sp, color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            MaterialButton(
              onPressed: () {
                signInWithGoogle();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 233, 107, 53),
                    borderRadius: BorderRadius.circular(10.sp)),
                height: 6.h,
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "OR sign up with google",
                      style: TextStyle(fontSize: 13.sp, color: Colors.black),
                    ),
                    VerticalDivider(
                      width: 1.w,
                    ),
                    SizedBox(
                      width: 10.w,
                      height: 5.h,
                      child: Image.asset(
                        "assets/images/google.png",
                      ),
                    )
                  ],
                )),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "have an account? ",
                  style: TextStyle(fontSize: 12.sp),
                ),
                TextButton(
                    onPressed: () {
                      Get.offAllNamed("/login");
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(fontSize: 12.sp),
                    ))
              ],
            )
          ],
        ));
  }
}
