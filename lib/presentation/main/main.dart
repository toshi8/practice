import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice/presentation/login/login_page.dart';
import 'package:practice/presentation/loginSample/login_main.dart';
import 'package:practice/presentation/signup/signup_page.dart';
import 'package:provider/provider.dart';

import '../book_list/book_list_page.dart';
import 'main_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //２行目だけだとエラーになるので追加
  await Firebase.initializeApp(); // ここ大事！Firebase使うのに初期化しないとエラーになる
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<MainModel>(
        create: (context) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Create model'),
          ),
          body: Consumer<MainModel>(
            builder: (context, model, child) {
              return Column(
                children: [
                  Text(
                    model.thisText,
                    // Provider.of<String>(context),
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      model.changeThisText();
                    },
                    child: Text('push'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookListPage()),
                      );
                    },
                    child: Text('view firebase'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                    child: Text('会員登録'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text('ログイン'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AuthTypeSelector()),
                      );
                    },
                    child: Text('ログインNew'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
