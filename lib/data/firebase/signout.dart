
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

signout()async
{

await FirebaseAuth.instance.signOut();
Get.toNamed("/login");
}
