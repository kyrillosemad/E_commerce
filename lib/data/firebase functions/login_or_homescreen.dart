import 'package:firebase_auth/firebase_auth.dart';

getuser() {
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    return false;
  } else {
    return true;
  }
}
