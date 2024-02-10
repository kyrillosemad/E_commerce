import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

bool loading = true;
get_favourite_data() async {
  List favourite = [];
  await FirebaseFirestore.instance
      .collection("favourite")
      .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then((value) {
    value.docs.forEach((element) {
      favourite.add({"name": element['name'], "price": element["price"]});
    });
  });
  loading = false;
  return favourite;
}
