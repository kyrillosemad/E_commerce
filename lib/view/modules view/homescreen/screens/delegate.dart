import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/data/local data/best_sellers_products_data.dart';
import 'package:restaurant_app/data/local data/for_you_products_data.dart';
import 'package:restaurant_app/view/modules%20view/item/screens/item.dart';

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
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List bestSellsSuggestions = demoBestSellsProducts
        .where((product) =>
            product.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    final List productsForYouSuggestions = demoProductsForYou
        .where((product) =>
            product.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    final List allProducts = bestSellsSuggestions + productsForYouSuggestions;
    return ListView.builder(
        itemCount: allProducts.length,
        itemBuilder: (BuildContext context, int index) {
          final product = allProducts[index];
          return Container(
            height: 10.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: const Color.fromARGB(255, 245, 168, 37)),
            margin: EdgeInsets.all(10.sp),
            child: ListTile(
              title: Text(
                product.title,
                style: TextStyle(fontSize: 15.sp, color: Colors.white),
              ),
              leading: Image.asset(product.image),
              onTap: () {
                Get.to(const ITEM(), arguments: {
                  "name": allProducts[index].title,
                  "image": allProducts[index].image,
                  "price": allProducts[index].price,
                  "phone": data[2],
                  "owner": data[0],
                });
              },
            ),
          );
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }
}
