// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AdminItem extends StatefulWidget {
  final cartController;
  const AdminItem({super.key, required this.cartController});

  @override
  State<AdminItem> createState() => _AdminItemState();
}

class _AdminItemState extends State<AdminItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 80.h,
      child: ListView.builder(
        itemCount: widget.cartController.carteData.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.sp),
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              color: Colors.white.withOpacity(0.6),
            ),
            margin: EdgeInsets.all(10.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Center(
                  child: Text(
                    "order details",
                    style: TextStyle(fontSize: 15.sp),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Center(
                  child: Text(
                    "${widget.cartController.carteData[index]['name']}",
                    style: TextStyle(fontSize: 15.sp),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "count :${widget.cartController.carteData[index]['count']}",
                  style: TextStyle(fontSize: 15.sp),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "price of unit :${widget.cartController.carteData[index]['price']}",
                  style: TextStyle(fontSize: 15.sp),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "total price :${widget.cartController.carteData[index]['total_price']}",
                  style: TextStyle(fontSize: 15.sp),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "owner :${widget.cartController.carteData[index]['owner']}",
                  style: TextStyle(fontSize: 15.sp),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "phone :${widget.cartController.carteData[index]['phone']}",
                  style: TextStyle(fontSize: 15.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: Container(
                    width: 40.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 86, 205, 92),
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    child: MaterialButton(
                      onPressed: () async {
                        widget.cartController.deleteCartDataForAdminFun(
                          widget.cartController.carteData[index]['name'],
                          widget.cartController.carteData[index]['price'],
                          widget.cartController.carteData[index]['total_price'],
                          widget.cartController.carteData[index]['owner'],
                          widget.cartController.carteData[index]['count'],
                          widget.cartController.carteData[index]['phone'],
                          widget.cartController.carteData[index]['uid'],
                        );
                      },
                      child: Text(
                        "Completed",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
