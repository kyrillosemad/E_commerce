import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/data/firebase/signout.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:restaurant_app/presentation/best_sellers_in_home_screen.dart';
import 'package:restaurant_app/presentation/cart.dart';
import 'package:restaurant_app/presentation/favourite.dart';
import 'package:restaurant_app/presentation/for_you_in_home_screen.dart';
import 'package:restaurant_app/presentation/home_screen_first_container.dart';
import 'package:sizer/sizer.dart';

class HOMESCREEN extends StatefulWidget {
  const HOMESCREEN({super.key});

  @override
  State<HOMESCREEN> createState() => _HOMESCREENState();
}

class _HOMESCREENState extends State<HOMESCREEN> {
  GlobalKey<ScaffoldState> scaffold_key = GlobalKey<ScaffoldState>();
  bool loading = true;
  List data = [];
  getdata() async {
    await FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (value) {
        (value.docs.forEach((element) {
          data.add(element['username']);
          data.add(element['email']);
          data.add(element['phone']);
          
        }));
      },
    );
    loading = false;
    setState(() {});
  }

  int item = 0;
  void initState() {
    // TODO: implement initState
    super.initState();

    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        key: scaffold_key,
        backgroundColor: Colors.white,
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////  drawer /////////////////////////////////////////////////////////////
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 245, 168, 37),
                  ),
                  accountName: loading == true
                      ? CircularProgressIndicator()
                      : Text("${data[0]}"),
                  accountEmail: loading == true
                      ? CircularProgressIndicator()
                      : Text("${data[1]}"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
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
                        color: Color.fromARGB(255, 245, 168, 37),
                        size: 25.sp,
                      ),
                      VerticalDivider(
                        width: 5.w,
                      ),
                      TextButton(
                          onPressed: () {
                            scaffold_key.currentState!.closeDrawer();
                          },
                          child: Text("Home",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Color.fromARGB(255, 245, 168, 37),
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
                        color: Color.fromARGB(255, 245, 168, 37),
                        size: 25.sp,
                      ),
                      VerticalDivider(
                        width: 2.w,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(FAVOURITE());
                          },
                          child: Text("favourite",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Color.fromARGB(255, 245, 168, 37),
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
                        color: Color.fromARGB(255, 245, 168, 37),
                        size: 25.sp,
                      ),
                      VerticalDivider(
                        width: 2.w,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(CART());
                          },
                          child: Text("cart",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Color.fromARGB(255, 245, 168, 37),
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
                        color: Color.fromARGB(255, 245, 168, 37),
                        size: 25.sp,
                      ),
                      VerticalDivider(
                        width: 2.w,
                      ),
                      TextButton(
                          onPressed: () {
                            signout();
                          },
                          child: Text("sign out",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Color.fromARGB(255, 245, 168, 37),
                              )))
                    ],
                  )
                ]),
              )
            ],
          ),
        ),
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////   bottomNavigationBar   /////////////////////////////////////////////////////////

        bottomNavigationBar: CurvedNavigationBar(
          index: 0,
          height: 6.5.h,
          items: <Widget>[
            Icon(Icons.favorite, size: 30),
            Icon(Icons.add_shopping_cart, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 245, 168, 37),
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) async {
            setState(() {
              item = index;
            });
            if (item == 0) {
              await Future.delayed(Duration(milliseconds: 650));
              Get.to(FAVOURITE());
            }
            if (item == 1) {
              await Future.delayed(Duration(milliseconds: 650));
              Get.to(CART());
            }
            if (item == 2) {
              await Future.delayed(Duration(milliseconds: 650));
              scaffold_key.currentState!.openDrawer();
            }
          },
          letIndexChange: (index) => true,
        ),

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////  body  //////////////////////////////////////////////////////////
        body: Padding(
          padding: EdgeInsets.all(1),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  first_container_home_screen(
                    loading: loading,
                    data: data,
                  ),
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  best_sellers_container(data: data),
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  for_you_container(data: data)
                ],
              ),
            ),
          ),
        ));
  }
}
