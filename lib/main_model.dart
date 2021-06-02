import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  String thisText = 'yes';

  void changeThisText() {
    thisText = 'new';
    notifyListeners();
  }
}
