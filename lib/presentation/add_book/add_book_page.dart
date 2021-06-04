import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_book_model.dart';

class AddBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddBookModel>(
      create: (context) => AddBookModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('追加'),
        ),
        body: Consumer<AddBookModel>(
          builder: (context, model, child) {
            return Column(
              children: [
                TextField(
                  onChanged: (text) {
                    model.bookTitle = text;
                  },
                ),
                TextButton(
                  onPressed: () async {
                    try {
                      // todo: firebaseに本を追加
                      await model.addBookToFirebase();
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('本を追加しました'),
                          content: Text(model.bookTitle),
                        ),
                      );
                      Navigator.pop(context);
                    } catch (e) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text(e.toString()),
                        ),
                      );
                    }
                  },
                  child: Text('追加'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
