import 'package:flutter/material.dart';
import 'package:practice/presentation/practice/signup/signup_model.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailInputController = new TextEditingController();
  final passwordInputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignupModel>(
      create: (context) => SignupModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('会員登録'),
        ),
        body: Consumer<SignupModel>(
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
                    child: Text('会員登録'),
                    // icon: Icons.person_add,
                    // backgroundColor: Colors.blueGrey,
                    onPressed: () async {
                      print('click');
                      // if (_formKey.currentState!.validate()) {
                      //   // await _register();
                      // }
                      try {
                        model.signup();
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text('メールアドレスを追加しました'),
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
