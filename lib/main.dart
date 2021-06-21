import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice/presentation/practice/fadeIn/fadein_page.dart';
import 'package:practice/presentation/practice/main/main_model.dart';
import 'package:practice/presentation/view/login/login.dart';
import 'package:provider/provider.dart';

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
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginView()),
                      );
                    },
                    child: Text('login'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FadeInPage()),
                      );
                    },
                    child: Text('test'),
                  ),
                  // Text(
                  //   model.thisText,
                  //   // Provider.of<String>(context),
                  //   style: TextStyle(
                  //     fontSize: 15,
                  //   ),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     model.changeThisText();
                  //   },
                  //   child: Text('push'),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => WhiskyListPage()),
                  //     );
                  //   },
                  //   child: Text('view whisky'),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => BookListPage()),
                  //     );
                  //   },
                  //   child: Text('view book'),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => SignupPage()),
                  //     );
                  //   },
                  //   child: Text('会員登録'),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => LoginPage()),
                  //     );
                  //   },
                  //   child: Text('ログイン'),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => AuthTypeSelector()),
                  //     );
                  //   },
                  //   child: Text('ログインNew'),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => RandomWords()),
                  //     );
                  //   },
                  //   child: Text('word list'),
                  // ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
