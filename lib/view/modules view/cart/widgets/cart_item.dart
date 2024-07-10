// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:restaurant_app/data/firebase%20functions/delete_from_cart.dart';
import 'package:sizer/sizer.dart';

class CartItem extends StatelessWidget {
  final cartController;
  const CartItem({super.key, required this.cartController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100.w,
        height: 80.h,
        child: ListView.builder(
          itemCount: cartController.carteData.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                deleteFromCart(
                    cartController.carteData[index]['name'],
                    cartController.carteData[index]['price'],
                    cartController.carteData[index]['total_price'],
                    cartController.carteData[index]['owner'],
                    cartController.carteData[index]['count'],
                    cartController.carteData[index]['phone'],
                    cartController.carteData[index]['uid']);
              },
              child: Container(
                padding: EdgeInsets.all(10.sp),
                height: 37.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: Colors.white.withOpacity(0.6)),
                margin: EdgeInsets.all(10.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "order details",
                          style: TextStyle(fontSize: 13.sp),
                        ),
                        const Icon(Icons.swipe),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Center(
                      child: Text(
                        "${cartController.carteData[index]['name']}",
                        style: TextStyle(fontSize: 13.sp),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "count :${cartController.carteData[index]['count']}",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "price of unit :${cartController.carteData[index]['price']}",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "total price :${cartController.carteData[index]['total_price']}",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "owner :${cartController.carteData[index]['owner']}",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "phone :${cartController.carteData[index]['phone']}",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
