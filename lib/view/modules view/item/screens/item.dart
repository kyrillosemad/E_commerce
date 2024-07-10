import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controller/cart.dart';
import 'package:restaurant_app/controller/favourite.dart';
import 'package:restaurant_app/view/modules%20view/item/widgets/item_lower_part.dart';
import 'package:restaurant_app/view/modules%20view/item/widgets/item_upper_part.dart';
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
  int totalCost = 0;
  final FavoriteController favoriteController = Get.put(FavoriteController());
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(1.sp),
          child: SingleChildScrollView(
              child: SizedBox(
            width: 100.w,
            height: 97.2.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ItemUpperPart(
                    favoriteController: favoriteController,
                    image: image,
                    name: name,
                    price: price),
                ItemLowerPart(
                    cartController: cartController,
                    image: image,
                    name: name,
                    owner: owner,
                    phone: phone,
                    price: price),
              ],
            ),
          ))),
    );
  }
}
