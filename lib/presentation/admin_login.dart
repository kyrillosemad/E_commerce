import 'package:flutter/material.dart';
import 'package:restaurant_app/data/firebase/admin_sign_in.dart';
import 'package:sizer/sizer.dart';

class ADMINLOGIN extends StatefulWidget {
  const ADMINLOGIN({super.key});

  @override
  State<ADMINLOGIN> createState() => _ADMINLOGINState();
}

class _ADMINLOGINState extends State<ADMINLOGIN> {
  TextEditingController key = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 245, 168, 37)),
      backgroundColor: Colors.white,
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////  body   ////////////////////////////////////////////////////
      body: Padding(
          padding: EdgeInsets.all(0.5),
          child: SafeArea(
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                /////////////////////////////////////////////////////////
                //////////////////////////////////////////////////////////
                Container(
                    width: 100.w,
                    height: 20.h,
                    child: Image.asset(
                      "assets/images/shape7.png",
                      fit: BoxFit.fill,
                    )),
                Container(
                  margin: EdgeInsets.only(left: 20.sp, right: 20.sp),
                  width: 100.w,
                  height: 58.h,
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "enter the admin key please",
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          TextFormField(
                            controller: key,
                            style: TextStyle(fontSize: 12.sp),
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.password),
                                label: Text(
                                  "Key",
                                  style: TextStyle(fontSize: 12.sp),
                                )),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          MaterialButton(
                            onPressed: () {
                              admin_sign_in(key.text);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 245, 168, 37),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              height: 6.h,
                              child: Center(
                                child: Text(
                                  "Login ",
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),

                Container(
                  width: 100.w,
                  height: 20.h,
                  child: Image.asset(
                    "assets/images/shape6.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ])))),
    );
  }
}
