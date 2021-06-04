import 'package:flutter/material.dart';
import 'package:practice/domain/book.dart';
import 'package:provider/provider.dart';

import 'add_book_model.dart';

class AddBookPage extends StatelessWidget {
  //{}を使うとからでも大丈夫
  AddBookPage({this.book});

  final Book? book;

  @override
  Widget build(BuildContext context) {
    final bool isUpdate = book != null;
    return ChangeNotifierProvider<AddBookModel>(
      create: (context) => AddBookModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text((isUpdate) ? '更新' : '追加'),
        ),
        body: Consumer<AddBookModel>(
          builder: (context, model, child) {
            return Column(
              children: [
                TextField(
                  controller: TextEditingController(
                    text: (isUpdate) ? book!.title : '',
                  ),
                  onChanged: (text) {
                    model.bookTitle = text;
                  },
                ),
                TextButton(
                  onPressed: () async {
                    await updateBook(isUpdate, model, context);
                  },
                  child: Text((isUpdate) ? '更新する' : '追加する'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future updateBook(
      bool isUpdate, AddBookModel model, BuildContext context) async {
    try {
      // todo: firebaseに本を追加
      (isUpdate) ? model.updateBook(book!) : model.addBookToFirebase();
      await showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('本を追加しました'),
          content: Text(model.bookTitle),
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      await showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }
}
