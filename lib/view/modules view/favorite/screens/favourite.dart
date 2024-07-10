import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controller/favourite.dart';
import 'package:restaurant_app/view/modules%20view/favorite/widgets/favorite_item.dart';
import 'package:sizer/sizer.dart';

class FAVOURITE extends StatefulWidget {
  const FAVOURITE({super.key});

  @override
  State<FAVOURITE> createState() => _FAVOURITEState();
}

class _FAVOURITEState extends State<FAVOURITE> {
  final FavoriteController favoriteController = Get.put(FavoriteController());
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
                      "favourite items",
                      style: TextStyle(fontSize: 20.sp, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Obx(() {
                  if (favoriteController.loading.value) {
                    return SizedBox(
                      height: 80.h,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (favoriteController.error.value ==
                      "there's something wrong") {
                    return SizedBox(
                      height: 80.h,
                      child: Center(
                        child: Text(
                          "there's something wrong",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                      ),
                    );
                  } else if (favoriteController.favoriteData.isEmpty) {
                    return SizedBox(
                      height: 80.h,
                      child: Center(
                        child: Text(
                          "there's no favorite items",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                      ),
                    );
                  } else {
                    return FavoriteItem(favoriteController: favoriteController);
                  }
                })
              ]),
        ));
  }
}
