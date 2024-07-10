// ignore_for_file: avoid_function_literals_in_foreach_calls
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/firebase%20functions/get_user_info.dart';
import 'package:restaurant_app/view/modules%20view/homescreen/widgets/best_sellers_in_home_screen.dart';
import 'package:restaurant_app/view/modules%20view/homescreen/widgets/for_you_in_home_screen.dart';
import 'package:restaurant_app/view/modules%20view/homescreen/widgets/home_screen_first_container.dart';
import 'package:restaurant_app/view/shared%20widgets/bottom_nav.dart';
import 'package:restaurant_app/view/shared%20widgets/drawer.dart';

class HOMESCREEN extends StatefulWidget {
  const HOMESCREEN({super.key});

  @override
  State<HOMESCREEN> createState() => _HOMESCREENState();
}

class _HOMESCREENState extends State<HOMESCREEN> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getdata();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        drawer: DrawerPart(
            data: data, loading: loading, scaffoldKey: scaffoldKey),
        bottomNavigationBar: BottomNavPart(scaffoldKey: scaffoldKey),
        body: Padding(
          padding: const EdgeInsets.all(1),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                FirstContainerHomeSCreen(
                  loading: loading,
                  data: data,
                ),
                BestSellerContainer(data: data),
                ForYouContainer(data: data)
              ],
            ),
          ),
        ));
  }
}
