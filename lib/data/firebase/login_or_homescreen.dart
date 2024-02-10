import 'package:firebase_auth/firebase_auth.dart';

getuser() {
  var User = FirebaseAuth.instance.currentUser;
  if (User == null) {
    return false;
  } else {
    return true;
  }
}
