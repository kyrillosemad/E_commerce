import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/data/best_sellers_products_data.dart';
import 'package:restaurant_app/data/for_you_products_data.dart';
import 'package:restaurant_app/presentation/item.dart';
import 'package:sizer/sizer.dart';

class ProductSearchDelegate extends SearchDelegate<String> {
  final String text;
  final List data;

  // Initialize query with the value of text
  ProductSearchDelegate(this.text, this.data);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // عرض اقتراحات البحث أثناء الكتابة
    final List bestSellsSuggestions = demoBestSellsProducts
        .where((product) =>
            product.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    final List productsForYouSuggestions = demoProductsForYou
        .where((product) =>
            product.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    final List all_products = bestSellsSuggestions + productsForYouSuggestions;
    return ListView.builder(
        itemCount: all_products.length,
        itemBuilder: (BuildContext context, int index) {
          // عرض اقتراحات أفضل المبيعات
          final product = all_products[index];
          return Container(
            height: 10.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: Color.fromARGB(255, 245, 168, 37)),
            margin: EdgeInsets.all(10.sp),
            child: ListTile(
              title: Text(
                product.title,
                style: TextStyle(fontSize: 15.sp, color: Colors.white),
              ),
              leading: Image.asset(product.image),
              onTap: () {
                Get.to(ITEM(), arguments: {
                  "name": all_products[index].title,
                  "image": all_products[index].image,
                  "price": all_products[index].price,
                  "phone": data[2],
                  "owner": data[0],
                });
              },
            ),
          );
          // عرض اقتراحات المنتجات الموصى بها لك
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }
}
