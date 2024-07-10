// prefer_typing_uninitialized_variables
// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/data/firebase%20functions/signout.dart';
import 'package:restaurant_app/view/modules%20view/cart/screens/cart.dart';
import 'package:restaurant_app/view/modules%20view/favorite/screens/favourite.dart';
import 'package:sizer/sizer.dart';

class DrawerPart extends StatelessWidget {
  final loading;
  final data;
  final scaffoldKey;
  const DrawerPart(
      {super.key,
      required this.data,
      required this.loading,
      required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 245, 168, 37),
              ),
              accountName: loading == true
                  ? const CircularProgressIndicator()
                  : Text(
                      "${data[0]}",
                      style: TextStyle(fontSize: 10.sp),
                    ),
              accountEmail: loading == true
                  ? const CircularProgressIndicator()
                  : Text(
                      "${data[1]}",
                      style: TextStyle(fontSize: 10.sp),
                    ),
              currentAccountPicture: CircleAvatar(
                radius: 15.sp,
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.person,
                ),
              )),
          SizedBox(
            height: 1.h,
          ),
          Container(
            padding: EdgeInsets.all(10.sp),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.home,
                    color: const Color.fromARGB(255, 245, 168, 37),
                    size: 23.sp,
                  ),
                  VerticalDivider(
                    width: 5.w,
                  ),
                  TextButton(
                      onPressed: () {
                        scaffoldKey.currentState!.closeDrawer();
                      },
                      child: Text("Home",
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: const Color.fromARGB(255, 245, 168, 37),
                          )))
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.favorite_outline,
                    color: const Color.fromARGB(255, 245, 168, 37),
                    size: 23.sp,
                  ),
                  VerticalDivider(
                    width: 2.w,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(const FAVOURITE());
                      },
                      child: Text("favourite",
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: const Color.fromARGB(255, 245, 168, 37),
                          )))
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: const Color.fromARGB(255, 245, 168, 37),
                    size: 23.sp,
                  ),
                  VerticalDivider(
                    width: 2.w,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(const CART());
                      },
                      child: Text("cart",
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: const Color.fromARGB(255, 245, 168, 37),
                          )))
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.exit_to_app,
                    color: const Color.fromARGB(255, 245, 168, 37),
                    size: 23.sp,
                  ),
                  VerticalDivider(
                    width: 2.w,
                  ),
                  TextButton(
                      onPressed: () {
                        signOut();
                      },
                      child: Text("sign out",
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: const Color.fromARGB(255, 245, 168, 37),
                          )))
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
