import 'package:cloud_firestore/cloud_firestore.dart';

bool loading2 = true;
get_cart_data_admin() async {
  List cart_for_admin = [];
  await FirebaseFirestore.instance
      .collection("cart")
      .orderBy(
        "time",
        descending: true,
      )
      .get()
      .then((value) {
    value.docs.forEach((element) {
      cart_for_admin.add({
        "name": element['name'],
        "price": element["price"],
        "total_price": element['total_price'],
        "count": element['count'],
        "phone": element['phone'],
        "owner": element['owner'],
        "uid": element['uid'],
      });
    });
  });

  loading2 = false;
  return cart_for_admin;
}
