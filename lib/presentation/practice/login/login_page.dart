import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_model.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailInputController = new TextEditingController();
  final passwordInputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
      create: (context) => LoginModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('ログイン'),
        ),
        body: Consumer<LoginModel>(
          builder: (context, model, child) {
            return Column(
              children: [
                TextField(
                  controller: emailInputController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'mail',
                  ),
                  onChanged: (text) {
                    model.mail = text;
                  },
                ),
                TextField(
                  controller: passwordInputController,
                  obscureText: true,
                  // validator: (String value) {
                  //   if (value.isEmpty) {
                  //     return 'Please enter some text';
                  //   }
                  //   return null;
                  // },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  onChanged: (text) {
                    model.password = text;
                  },
                ),
                Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    child: Text('ログイン'),
                    // icon: Icons.person_add,
                    // backgroundColor: Colors.blueGrey,
                    onPressed: () async {
                      print('click');
                      // if (_formKey.currentState!.validate()) {
                      //   // await _register();
                      // }
                      try {
                        model.login();
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text('メールアドレスでログインしました。'),
                          ),
                        );
                      } catch (e) {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text(e.toString()),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
