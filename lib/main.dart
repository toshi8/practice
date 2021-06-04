import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice/main_model.dart';
import 'package:provider/provider.dart';

import 'book_list.dart';

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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
