import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

bool loading = true;
getFavoriteData() async {
  List favourite = [];
  await FirebaseFirestore.instance
      .collection("favourite")
      .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then((value) {
    for (var element in value.docs) {
      favourite.add({
        "name": element['name'],
        "price": element["price"],
        "favorite": element["favorite"],
        "owner": element["owner"]
      });
    }
  });
  loading = false;
  return favourite;
}
