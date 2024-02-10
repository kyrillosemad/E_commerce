import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/data/firebase/setdata_tocart.dart';
import 'package:restaurant_app/data/firebase/setdata_tofavourite.dart';
import 'package:sizer/sizer.dart';

class ITEM extends StatefulWidget {
  const ITEM({super.key});

  @override
  State<ITEM> createState() => _ITEMState();
}

class _ITEMState extends State<ITEM> {
  String name = Get.arguments["name"];
  String image = Get.arguments["image"];
  String price = Get.arguments["price"];
  String phone = Get.arguments['phone'];
  String owner = Get.arguments['owner'];
  int count = 0;
  int totalcost = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      ////////////////////////////////////////////////////   body   /////////////////////////////////////////////////////////////
      body: Padding(
        padding: EdgeInsets.all(1.sp),
        child: SafeArea(
            child: SingleChildScrollView(
                child: Container(
          width: 100.w,
          height: 97.2.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////    first container   /////////////////////////////////////////////////////////
              Container(
                width: 100.w,
                height: 50.h,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/shape3.png"),
                        fit: BoxFit.fill)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        MaterialButton(
                          child: Icon(
                            Icons.arrow_back,
                            size: 22.sp,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        MaterialButton(
                          child: Icon(
                            Icons.favorite,
                            size: 30.sp,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            data_tofavourite(name, price,
                                FirebaseAuth.instance.currentUser!.uid);
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      name,
                      style: TextStyle(fontSize: 20.sp, color: Colors.white),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      width: 90.w,
                      height: 30.h,
                      child: Image.asset(
                        image,
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
              ),
              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////  second_container   /////////////////////////////////////////////////////
              Container(
                width: 100.w,
                height: 47.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60.w,
                      height: 7.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp)),
                      child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  if (count - 1 >= 0) {
                                    setState(() {
                                      count--;
                                      totalcost = count * int.parse(price);
                                    });
                                  }
                                },
                                child: Icon(
                                  Icons.remove,
                                  size: 25.sp,
                                ),
                              ),
                              Text(
                                "${count}",
                                style: TextStyle(fontSize: 20.sp),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    count++;
                                    totalcost = count * int.parse(price);
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 25.sp,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "${price} \$",
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "total cost ${totalcost}",
                      style: TextStyle(fontSize: 25.sp, color: Colors.black),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    MaterialButton(
                      onPressed: () {
                        if (count > 0) {
                          data_tocart(name, price, totalcost, owner, count,
                              phone, FirebaseAuth.instance.currentUser!.uid);
                              
                          Get.snackbar(
                              "DONE", "the item has been added to cart",
                              backgroundColor: Colors.white);
                        } else {
                          Get.snackbar("failed", "please specify how many",
                              backgroundColor: Colors.white);
                        }
                      },
                      child: Container(
                        width: 45.w,
                        height: 6.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.sp),
                          color: const Color.fromARGB(255, 245, 168, 37),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_bag,
                              size: 25.sp,
                              color: Colors.white,
                            ),
                            Text(
                              "Add to cart",
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ))),
      ),
    );
  }
}
