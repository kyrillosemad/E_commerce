import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controller/favourite.dart';
import 'package:restaurant_app/data/local data/best_sellers_products_data.dart';
import 'package:restaurant_app/view/modules%20view/item/screens/item.dart';
import 'package:sizer/sizer.dart';

class BestSellerContainer extends StatelessWidget {
  BestSellerContainer({
    super.key,
    required this.data,
  });

  final List data;
  final FavoriteController favoriteController = Get.put(FavoriteController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.sp),
      width: 100.w,
      height: 43.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Best sellers",
            style: TextStyle(fontSize: 20.sp),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            width: 100.w,
            height: 33.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: demoBestSellsProducts.length,
              itemBuilder: (BuildContext context, int index) {
                return MaterialButton(
                  onPressed: () {
                    Get.to(const ITEM(), arguments: {
                      "name": demoBestSellsProducts[index].title,
                      "image": demoBestSellsProducts[index].image,
                      "price": demoBestSellsProducts[index].price,
                      "phone": data[2],
                      "owner": data[0],
                    });
                  },
                  child: Container(
                    height: 30.h,
                    margin: EdgeInsets.all(5.sp),
                    padding: EdgeInsets.all(5.sp),
                    width: 60.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/shape2.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10.sp),
                          width: 60.w,
                          height: 20.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40.w,
                                height: 17.h,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "${demoBestSellsProducts[index].image}",
                                        ),
                                        fit: BoxFit.fill)),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(top: 10.sp, right: 5.sp),
                                width: 15.w,
                                height: 7.h,
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {
                                      favoriteController.setFavoriteDataFun(
                                          demoBestSellsProducts[index].title,
                                          double.parse(
                                              demoBestSellsProducts[index]
                                                  .price
                                                  .toString()),
                                          FirebaseAuth
                                              .instance.currentUser!.uid);
                                      Get.snackbar("DONE",
                                          "the item has been added to favourite",
                                          backgroundColor: Colors.white);
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      size: 40.sp,
                                    ),
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 60.w,
                          height: 4.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 32.w,
                                height: 6.h,
                                child: Center(
                                  child: Text(
                                    "${demoBestSellsProducts[index].title}",
                                    style: TextStyle(
                                        fontSize: 15.sp, color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 22.w,
                                height: 6.h,
                                child: Center(
                                  child: Text(
                                    "${demoBestSellsProducts[index].price} \$",
                                    style: TextStyle(
                                        fontSize: 15.sp, color: Colors.white),
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
