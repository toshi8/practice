import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  String mail = '';
  String password = '';

  FirebaseAuth auth = FirebaseAuth.instance;

  Future login() async {
    if (mail.isEmpty) {
      throw ('メールアドレスを入力してください');
    }
    if (password.isEmpty) {
      throw ('パスワードを入力してください');
    }
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: mail,
      password: password,
    );
    print(userCredential.user);
  }
}
