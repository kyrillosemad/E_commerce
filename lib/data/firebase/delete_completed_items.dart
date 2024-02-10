import 'package:cloud_firestore/cloud_firestore.dart';

complet_cart_item(name, price, total_price, owner, count, phone, uid) {
  FirebaseFirestore.instance
      .collection("cart")
      .doc("${name}${price}${total_price}${owner}${count}${phone}${uid}")
      .delete();
}
