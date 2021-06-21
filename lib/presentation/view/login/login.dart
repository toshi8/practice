import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/presentation/view/components/round_button.dart';
import 'package:practice/presentation/view/login/login_background.dart';

import '../constants.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "test",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: size.height * 0.15),
          RoundButton(
            text: "会員登録",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginView();
                  },
                ),
              );
            },
          ),
          RoundButton(
            text: "ログイン",
            color: kPrimaryLightColor,
            textColor: Colors.black,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginView();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
