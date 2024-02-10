import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restaurant_app/data/firebase/delete_completed_items.dart';
import 'package:restaurant_app/data/firebase/get_all_cart.dart';
import 'package:sizer/sizer.dart';

class ADMIN extends StatefulWidget {
  const ADMIN({super.key});

  @override
  State<ADMIN> createState() => _ADMINState();
}

class _ADMINState extends State<ADMIN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////  body   ///////////////////////////////////////////////////////////////
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 25.sp, left: 10.sp, right: 10.sp),
          width: 100.w,
          height: 100.h,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
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
                        Get.offAllNamed("/login");
                      },
                      icon: Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                        size: 25.sp,
                      )),
                  Text(
                    "cart items for all users",
                    style: TextStyle(fontSize: 17.sp, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                width: 100.w,
                height: 80.h,
                child: FutureBuilder(
                  future: get_cart_data_admin(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Container(
                      child: loading2 == true
                          ? Center(
                              child: Text(
                                "loading ...",
                                style: TextStyle(fontSize: 20.sp),
                              ),
                            )
                          : ListView.builder(
                              itemCount:
                                  snapshot.hasData ? snapshot.data.length : 0,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: EdgeInsets.all(10.sp),
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                      color: Colors.white.withOpacity(0.6)),
                                  margin: EdgeInsets.all(10.sp),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          "${snapshot.data[index]['name']}",
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "count :${snapshot.data[index]['count']}",
                                        style: TextStyle(fontSize: 15.sp),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "price of unit :${snapshot.data[index]['price']}",
                                        style: TextStyle(fontSize: 15.sp),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "total price :${snapshot.data[index]['total_price']}",
                                        style: TextStyle(fontSize: 15.sp),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "owner :${snapshot.data[index]['owner']}",
                                        style: TextStyle(fontSize: 15.sp),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "phone :${snapshot.data[index]['phone']}",
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
                                                color: Color.fromARGB(
                                                    255, 86, 205, 92),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.sp)),
                                            child: MaterialButton(
                                              onPressed: () async {
                                                complet_cart_item(
                                                    snapshot.data[index]
                                                        ['name'],
                                                    snapshot.data[index]
                                                        ['price'],
                                                    snapshot.data[index]
                                                        ['total_price'],
                                                    snapshot.data[index]
                                                        ['owner'],
                                                    snapshot.data[index]
                                                        ['count'],
                                                    snapshot.data[index]
                                                        ['phone'],
                                                    snapshot.data[index]
                                                        ['uid']);

                                                Get.defaultDialog(
                                                    title: "DONE",
                                                    content: Text(
                                                        "the item is completed"));
                                                await Future.delayed(Duration(
                                                    milliseconds: 1500));
                                                Get.back();

                                                setState(() {});
                                              },
                                              child: Text(
                                                "Completed",
                                                style:
                                                    TextStyle(fontSize: 15.sp),
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
