import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controller/cart.dart';
import 'package:restaurant_app/view/modules%20view/cart/widgets/cart_item.dart';
import 'package:sizer/sizer.dart';

class CART extends StatefulWidget {
  const CART({super.key});

  @override
  State<CART> createState() => _CARTState();
}

class _CARTState extends State<CART> {
  final CartController cartController = Get.put(CartController());
  @override
  void initState() {
    super.initState();
    cartController.getCartDataFun();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 25.sp, left: 10.sp, right: 10.sp),
        width: 100.w,
        height: 100.h,
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/shape3.png"),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 25.sp,
                    )),
                Text(
                  "cart items",
                  style: TextStyle(fontSize: 20.sp, color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Obx(() {
              if (cartController.loading.value) {
                return SizedBox(
                  height: 80.h,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (cartController.error.value ==
                  "there's something wrong") {
                return SizedBox(
                  height: 80.h,
                  child: const Center(
                    child: Text("there,s something wrong"),
                  ),
                );
              } else if (cartController.carteData.isEmpty) {
                return SizedBox(
                  height: 80.h,
                  child: const Center(
                    child: Text("there,s no items now"),
                  ),
                );
              } else {
                return CartItem(cartController: cartController);
              }
            })
          ],
        ),
      ),
    );
  }
}
