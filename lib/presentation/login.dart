import 'package:flutter/material.dart';
import 'package:restaurant_app/presentation/admin_login.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/data/firebase/signin.dart';

class LOGIN extends StatefulWidget {
  const LOGIN({super.key});

  @override
  State<LOGIN> createState() => _LOGINState();
}

class _LOGINState extends State<LOGIN> {
  bool checkbox1 = false;
  GlobalKey<FormState> login_form = GlobalKey<FormState>();
  TextEditingController login_email = TextEditingController();
  TextEditingController login_password = TextEditingController();
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
                  //////////////////////////////////////////////////////  first photo    ///////////////////////////////////////////////////////////

                  Container(
                    width: 100.w,
                    height: 20.h,
                    child: Image.asset(
                      "assets/images/shape7.png",
                      fit: BoxFit.fill,
                    ),
                  ),

                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  //////////////////////////////////////////////////////  the form  ///////////////////////////////////////////////////////////

                  Container(
                    margin: EdgeInsets.only(left: 20.sp, right: 20.sp),
                    width: 100.w,
                    height: 58.h,
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "welcome back !",
                            style: TextStyle(fontSize: 20.sp),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Form(
                              key: login_form,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: login_email,
                                    validator: (val) {
                                      if (val!.length < 10) {
                                        return "invalid Email, must be greater than 10";
                                      }
                                      return null;
                                    },
                                    style: TextStyle(fontSize: 12.sp),
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.email),
                                        label: Text(
                                          "Email",
                                          style: TextStyle(fontSize: 12.sp),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  TextFormField(
                                    validator: (val) {
                                      if (val!.length < 8) {
                                        return "weak password";
                                      }
                                      return null;
                                    },
                                    controller: login_password,
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
                                    height: 3.h,
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      signin(
                                          login_form.currentState,
                                          login_email.text,
                                          login_password.text);
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
                                          "Login ",
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Don't have an account? ",
                                        style: TextStyle(fontSize: 12.sp),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Get.offAllNamed("signup");
                                          },
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(fontSize: 12.sp),
                                          ))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Admin ?",
                                        style: TextStyle(fontSize: 12.sp),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Get.to(ADMINLOGIN());
                                          },
                                          child: Text(
                                            "click here",
                                            style: TextStyle(fontSize: 12.sp),
                                          ))
                                    ],
                                  ),
                                ],
                              ))
                        ]),
                  ),

                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  ///////////////////////////////////////////////////////// last photo ////////////////////////////////////////////////////////
                  Container(
                    width: 100.w,
                    height: 20.h,
                    child: Image.asset(
                      "assets/images/shape6.png",
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
