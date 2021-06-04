import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  String thisText = 'yesNo';

  void changeThisText() {
    thisText = 'new';
    notifyListeners();
  }
}
