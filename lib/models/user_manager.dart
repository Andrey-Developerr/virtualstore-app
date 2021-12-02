import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:fruit_store/helpers/firebase_errors.dart';
import 'package:fruit_store/models/user_login.dart';

class UserManager extends ChangeNotifier {
  UserManager() {
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  late User kuser;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> signIn(
      {required UserLogin user,
      required Function onFail,
      required Function onSucess}) async {
    loading = true;
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      kuser = result.user!;

      await Future.delayed(const Duration(seconds: 3));

      onSucess();
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUser() async {
    var kuser = FirebaseAuth.instance.currentUser;
    print(kuser?.uid);
  }
}
