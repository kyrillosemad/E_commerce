import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: avoid_types_as_parameter_names
dataToCart(name, price, totalPrice, owner, count, phone, uid) {
  FirebaseFirestore.instance
      .collection("cart")
      .doc("$name$price$totalPrice$owner$count$phone$uid")
      .set({
    "name": name,
    "price": price,
    "total_price": totalPrice,
    "owner": owner,
    "count": count,
    "phone": phone,
    "uid": uid,
    "time": DateTime.now().year +
        DateTime.now().month * 60 * 60 * 30 * 12 +
        DateTime.now().day * 60 * 60 * 30 +
        DateTime.now().hour * 60 * 60 +
        DateTime.now().minute * 60 +
        DateTime.now().second * 1
  });
}
