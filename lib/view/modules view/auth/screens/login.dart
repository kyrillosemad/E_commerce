import 'package:flutter/material.dart';
import 'package:restaurant_app/view/modules%20view/auth/widgets/login_form.dart';
import 'package:sizer/sizer.dart';

class LOGIN extends StatefulWidget {
  const LOGIN({super.key});

  @override
  State<LOGIN> createState() => _LOGINState();
}

class _LOGINState extends State<LOGIN> {
  bool checkbox1 = false;
  GlobalKey<FormState> loginForm = GlobalKey<FormState>();
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
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
                    height: 20.h,
                    child: Image.asset(
                      "assets/images/shape7.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.sp, right: 20.sp),
                    width: 100.w,
                    height: 58.h,
                    color: const Color.fromARGB(255, 255, 255, 255),
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
                          LoginForm(
                              loginEmail: loginEmail,
                              loginForm: loginForm,
                              loginPassword: loginPassword),
                        ]),
                  ),
                  SizedBox(
                    width: 100.w,
                    height: 20.h,
                    child: Image.asset(
                      "assets/images/shape6.png",
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
