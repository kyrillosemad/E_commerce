// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ItemUpperPart extends StatelessWidget {
  final image;
  final name;
  final price;
  final favoriteController;
  const ItemUpperPart({super.key,required this.favoriteController,required this.image,required this.name,required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 50.h,
      alignment: Alignment.topCenter,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/shape3.png"), fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  color: Colors.red,
                ),
                onPressed: () {
                  favoriteController.setFavoriteDataFun(
                      name,
                      double.parse(price.toString()),
                      FirebaseAuth.instance.currentUser!.uid);
                  Get.snackbar("DONE", "the item has been added to favourite",
                      backgroundColor: Colors.white);
                },
              )
            ],
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
          SizedBox(
            width: 90.w,
            height: 30.h,
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
