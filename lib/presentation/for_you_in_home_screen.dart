import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restaurant_app/data/best_sellers_products_data.dart';
import 'package:restaurant_app/data/firebase/setdata_tofavourite.dart';
import 'package:restaurant_app/data/for_you_products_data.dart';
import 'package:restaurant_app/presentation/item.dart';
import 'package:sizer/sizer.dart';

class for_you_container extends StatelessWidget {
  const for_you_container({
    super.key,
    required this.data,
  });

  final List data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.sp),
      width: 100.w,
      height: 38.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "For you",
            style: TextStyle(fontSize: 20.sp),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            width: 100.w,
            height: 30.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: demoProductsForYou.length,
              itemBuilder: (BuildContext context, int index) {
                return MaterialButton(
                  onPressed: () {
                    Get.to(ITEM(), arguments: {
                      "name": demoProductsForYou[index].title,
                      "image": demoProductsForYou[index].image,
                      "price": demoProductsForYou[index].price,
                      "phone": data[2],
                      "owner": data[0],
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(5.sp),
                    padding: EdgeInsets.all(5.sp),
                    width: 60.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/shape2.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10.sp),
                          width: 60.w,
                          height: 20.h,
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40.w,
                                height: 17.h,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "${demoProductsForYou[index].image}",
                                        ),
                                        fit: BoxFit.fill)),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 10.sp, right: 5.sp),
                                width: 15.w,
                                height: 7.h,
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {
                                      data_tofavourite(
                                          demoProductsForYou[
                                                  index]
                                              .title,
                                          demoProductsForYou[
                                                  index]
                                              .price,
                                          FirebaseAuth.instance
                                              .currentUser!.uid);
                                      Get.snackbar("DONE",
                                          "the item has been added to favourite",
                                          backgroundColor:
                                              Colors.white);
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      size: 40.sp,
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 60.w,
                          height: 5.h,
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            crossAxisAlignment:
                                CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 32.w,
                                child: Center(
                                  child: Text(
                                    "${demoProductsForYou[index].title}",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                width: 22.w,
                                height: 5.h,
                                child: Center(
                                  child: Text(
                                    "${demoBestSellsProducts[index].price} \$",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

