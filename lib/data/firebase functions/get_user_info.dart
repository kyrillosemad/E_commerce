// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

bool loading = true;
List data = [];
getdata() async {
  await FirebaseFirestore.instance
      .collection("users")
      .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then(
    (value) {
      (value.docs.forEach((element) {
        data.add(element['username']);
        data.add(element['email']);
        data.add(element['phone']);
      }));
    },
  );
  loading = false;
}
