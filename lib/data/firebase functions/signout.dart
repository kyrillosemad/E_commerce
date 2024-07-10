import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

signOut() async {
  await FirebaseAuth.instance.signOut();
  Get.toNamed("/login");
}
