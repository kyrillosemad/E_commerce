import 'package:cloud_firestore/cloud_firestore.dart';

bool loading2 = true;
getCartDataAdmin() async {
  List cartForAdmin = [];
  await FirebaseFirestore.instance
      .collection("cart")
      .orderBy(
        "time",
        descending: true,
      )
      .get()
      .then((value) {
    for (var element in value.docs) {
      cartForAdmin.add({
        "name": element['name'],
        "price": element["price"],
        "total_price": element['total_price'],
        "count": element['count'],
        "phone": element['phone'],
        "owner": element['owner'],
        "uid": element['uid'],
      });
    }
  });

  loading2 = false;
  return cartForAdmin;
}
