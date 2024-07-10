import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

bool loading = true;
getCartData() async {
  List cart = [];
  await FirebaseFirestore.instance
      .collection("cart")
      .orderBy(
        "time",
        descending: true,
      )
      .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then((value) {
    for (var element in value.docs) {
      cart.add({
        "name": element['name'],
        "price": element["price"],
        "total_price": element['total_price'],
        "count": element['count'],
        "phone": element['phone'],
        "owner": element['owner'],
        "uid": element['uid']
      });
    }
  });

  loading = false;
  return cart;
}
