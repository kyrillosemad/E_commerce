// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ItemLowerPart extends StatefulWidget {
  final image;
  final name;
  final owner;
  final phone;
  final price;
  final cartController;
  const ItemLowerPart(
      {super.key,
      required this.cartController,
      required this.image,
      required this.name,
      required this.owner,
      required this.phone,
      required this.price});

  @override
  State<ItemLowerPart> createState() => _ItemLowerPartState();
}

class _ItemLowerPartState extends State<ItemLowerPart> {
  int count = 0;
  int totalCost = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 47.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60.w,
            height: 7.h,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.sp)),
            child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        if (count - 1 >= 0) {
                          setState(() {
                            count--;
                            totalCost = count * int.parse(widget.price);
                          });
                        }
                      },
                      child: Icon(
                        Icons.remove,
                        size: 25.sp,
                      ),
                    ),
                    Text(
                      "$count",
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          count++;
                          totalCost = count * int.parse(widget.price);
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
            "${widget.price} \$",
            style: TextStyle(fontSize: 20.sp),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            "total cost $totalCost",
            style: TextStyle(fontSize: 25.sp, color: Colors.black),
          ),
          SizedBox(
            height: 5.h,
          ),
          MaterialButton(
            onPressed: () {
              if (count > 0) {
                widget.cartController.setCartDataFun(
                    widget.name,
                    double.parse(widget.price.toString()),
                    totalCost,
                    widget.owner,
                    count,
                    widget.phone,
                    FirebaseAuth.instance.currentUser!.uid);
                Get.snackbar("DONE", "the item has been added to cart",
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
                    style: TextStyle(fontSize: 15.sp, color: Colors.white),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
