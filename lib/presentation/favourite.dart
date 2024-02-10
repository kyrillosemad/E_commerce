import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/data/firebase/get_favourite_data.dart';
import 'package:sizer/sizer.dart';

class FAVOURITE extends StatefulWidget {
  const FAVOURITE({super.key});

  @override
  State<FAVOURITE> createState() => _FAVOURITEState();
}

class _FAVOURITEState extends State<FAVOURITE> {
  @override
  void initState() {
    super.initState();
    get_favourite_data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////   body   ////////////////////////////////////////////////////////////
      body: Container(
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
            Container(
              width: 100.w,
              height: 80.h,
              child: FutureBuilder(
                future: get_favourite_data(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Container(
                    child: loading == true
                        ? Center(
                            child: Text(
                              "loading ...",
                              style: TextStyle(fontSize: 20.sp),
                            ),
                          )
                        : ListView.builder(
                            itemCount:
                                snapshot.hasData ? snapshot.data!.length : 0,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                width: 70.w,
                                height: 7.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.sp),
                                  color: Colors.white.withOpacity(0.6),
                                ),
                                margin: EdgeInsets.all(10.sp),
                                child: ListTile(
                                  title: Text(
                                    "${snapshot.data[index]['name']}",
                                    style: TextStyle(fontSize: 15.sp),
                                  ),
                                  trailing: Text(
                                    "${snapshot.data[index]['price']} \$",
                                    style: TextStyle(fontSize: 15.sp),
                                  ),
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
    );
  }
}
