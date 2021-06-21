import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupModel extends ChangeNotifier {
  String mail = '';
  String password = '';

  FirebaseAuth auth = FirebaseAuth.instance;

  Future signup() async {
    if (mail.isEmpty) {
      throw ('メールアドレスを入力してください');
    }
    if (password.isEmpty) {
      throw ('パスワードを入力してください');
    }
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: mail,
      password: password,
    );
    await FirebaseFirestore.instance.collection('user').add(
      {
        'mail': mail,
        'password': password,
        'updateAt': DateTime.now(),
      },
    );
  }
}
