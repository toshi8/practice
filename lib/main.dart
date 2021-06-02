import 'package:flutter/material.dart';
import 'package:practice/main_model.dart';
import 'package:provider/provider.dart';

void main() {
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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
