import 'package:flutter/material.dart';

import 'package:restaurant_app/data/local data/categories_icons_data.dart';
import 'package:restaurant_app/view/modules%20view/homescreen/screens/delegate.dart';
import 'package:sizer/sizer.dart';

class FirstContainerHomeSCreen extends StatelessWidget {
  FirstContainerHomeSCreen({
    super.key,
    required this.loading,
    required this.data,
  });

  final bool loading;
  final List data;
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5.sp),
        width: 100.w,
        height: 45.h,
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/shape1.png"),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "cairo,Egypt",
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage(
                      "assets/images/project_20231013_0354331-٠١.png"),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "hello",
              style: TextStyle(color: Colors.white, fontSize: 15.sp),
            ),
            SizedBox(
              height: 1.h,
            ),
            loading == true
                ? const CircularProgressIndicator()
                : Text(
                    "${data[0]}",
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
            SizedBox(
              height: 3.h,
            ),
            MaterialButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: ProductSearchDelegate(search.text, data),
                );
              },
              child: Container(
                  width: 100.w,
                  height: 6.3.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.sp)),
                  child: Center(
                    child: Text(
                      "click here for search !",
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  )),
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              width: 100.w,
              height: 12.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: demoCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(5.sp),
                    width: 30.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 254, 226),
                        borderRadius: BorderRadius.circular(10.sp)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 15.w,
                            height: 5.h,
                            child: Image.asset("${demoCategories[index].icon}"),
                          ),
                          Text(
                            "${demoCategories[index].title}",
                            style: TextStyle(fontSize: 15.sp),
                          )
                        ]),
                  );
                },
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
          ],
        ));
  }
}
