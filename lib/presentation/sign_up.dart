import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:restaurant_app/data/firebase/signup.dart';
import 'package:restaurant_app/data/firebase/with_google.dart';
import 'package:sizer/sizer.dart';

class SIGNUP extends StatefulWidget {
  const SIGNUP({super.key});

  @override
  State<SIGNUP> createState() => _SIGNUPState();
}

class _SIGNUPState extends State<SIGNUP> {
  bool? checkbox1 = false;
  GlobalKey<FormState> signup_form = GlobalKey<FormState>();
  TextEditingController signup_username = TextEditingController();
  TextEditingController signup_email = TextEditingController();
  TextEditingController signup_password = TextEditingController();
  TextEditingController signup_phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(0.5),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  ///////////////////////////////////////////////////  first photo  //////////////////////////////////////////////////////////////
                  Container(
                    width: 100.w,
                    height: 15.h,
                    child: Image.asset(
                      "assets/images/shape8.png",
                      fit: BoxFit.fill,
                    ),
                  ),

                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  ///////////////////////////////////////////////////   the form  //////////////////////////////////////////////////////////////
                  Container(
                    margin: EdgeInsets.only(left: 20.sp, right: 20.sp),
                    width: 100.w,
                    height: 68.h,
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "welcome !",
                            style: TextStyle(fontSize: 20.sp),
                          ),
                          Form(
                              key: signup_form,
                              child: Column(
                                children: [
                                  TextFormField(
                                    validator: (val) {
                                      if (val!.length < 4) {
                                        return "invalid username, must be greater than 10";
                                      }
                                      return null;
                                    },
                                    controller: signup_username,
                                    style: TextStyle(fontSize: 12.sp),
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.email),
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
                                    controller: signup_email,
                                    style: TextStyle(fontSize: 12.sp),
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.email),
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
                                    controller: signup_phone,
                                    style: TextStyle(fontSize: 12.sp),
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.phone),
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
                                    controller: signup_password,
                                    style: TextStyle(fontSize: 12.sp),
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.password),
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
                                        signup_form.currentState,
                                        signup_email.text,
                                        signup_password.text,
                                        signup_username.text,
                                        signup_phone.text,
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 245, 168, 37),
                                          borderRadius:
                                              BorderRadius.circular(10.sp)),
                                      height: 6.h,
                                      child: Center(
                                        child: Text(
                                          "SIGN UP ",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.black),
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
                                          color:
                                              Color.fromARGB(255, 233, 107, 53),
                                          borderRadius:
                                              BorderRadius.circular(10.sp)),
                                      height: 6.h,
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "OR sign up with google",
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                color: Colors.black),
                                          ),
                                          VerticalDivider(
                                            width: 1.w,
                                          ),
                                          Container(
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
                              ))
                        ]),
                  ),

                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  ////////////////////////////////////////////////////////   last photo /////////////////////////////////////////////////////////
                  Container(
                    width: 100.w,
                    height: 17.h,
                    child: Image.asset(
                      "assets/images/shape9.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                ],
              ),
            ),
          ),
        ));
  }
}
