import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controller/cart.dart';
import 'package:restaurant_app/view/modules%20view/admin/widgets/admin_item.dart';
import 'package:sizer/sizer.dart';

class ADMIN extends StatefulWidget {
  const ADMIN({super.key});

  @override
  State<ADMIN> createState() => _ADMINState();
}

class _ADMINState extends State<ADMIN> {
  final CartController cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    cartController.getCartDataFunForAdmin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 25.sp, left: 10.sp, right: 10.sp),
          width: 100.w,
          height: 100.h,
          alignment: Alignment.topCenter,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/shape3.png"),
              fit: BoxFit.fill,
            ),
          ),
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
                      Get.offAllNamed("/login");
                    },
                    icon: Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                      size: 25.sp,
                    ),
                  ),
                  Text(
                    "cart items for all users",
                    style: TextStyle(fontSize: 17.sp, color: Colors.white),
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
                    child: Center(
                      child: Text(
                        "there's something wrong",
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                    ),
                  );
                } else if (cartController.carteData.isEmpty) {
                  return SizedBox(
                    height: 80.h,
                    child: Center(
                      child: Text(
                        "there's no orders now",
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                    ),
                  );
                } else {
                  return AdminItem(cartController: cartController);
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
