import 'package:flutter/material.dart';
import 'package:restaurant_app/view/modules%20view/auth/widgets/signup_form.dart';
import 'package:sizer/sizer.dart';

class SIGNUP extends StatefulWidget {
  const SIGNUP({super.key});

  @override
  State<SIGNUP> createState() => _SIGNUPState();
}

class _SIGNUPState extends State<SIGNUP> {
  bool? checkbox1 = false;
  GlobalKey<FormState> signupForm = GlobalKey<FormState>();
  TextEditingController signupUsername = TextEditingController();
  TextEditingController signupEmail = TextEditingController();
  TextEditingController signupPassword = TextEditingController();
  TextEditingController signupPhone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(0.5),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 15.h,
                    child: Image.asset(
                      "assets/images/shape8.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.sp, right: 20.sp),
                    width: 100.w,
                    height: 68.h,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "welcome !",
                            style: TextStyle(fontSize: 20.sp),
                          ),
                          SignUpForm(
                              signupEmail: signupEmail,
                              signupForm: signupForm,
                              signupPassword: signupPassword,
                              signupPhone: signupPhone,
                              signupUsername: signupUsername),
                        ]),
                  ),
                  SizedBox(
                    width: 100.w,
                    height: 17.h,
                    child: Image.asset(
                      "assets/images/shape9.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
