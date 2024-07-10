// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FavoriteItem extends StatelessWidget {
  final favoriteController;
  const FavoriteItem({super.key, required this.favoriteController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 80.h,
      child: ListView.builder(
        itemCount: favoriteController.favoriteData.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            onDismissed: (direction) {
              favoriteController.deleteFavoriteDataFun(
                  favoriteController.favoriteData[index]['name'],
                  favoriteController.favoriteData[index]['owner']);
            },
            key: UniqueKey(),
            child: Container(
              width: 70.w,
              height: 7.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.sp),
                color: Colors.white.withOpacity(0.6),
              ),
              margin: EdgeInsets.all(10.sp),
              child: ListTile(
                leading: const Icon(Icons.swipe),
                title: Text(
                  "${favoriteController.favoriteData[index]['name']}",
                  style: TextStyle(fontSize: 15.sp),
                ),
                trailing: Text(
                  "${favoriteController.favoriteData[index]['price']} \$",
                  style: TextStyle(fontSize: 15.sp),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
