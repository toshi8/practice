import 'package:flutter/material.dart';
import 'package:practice/presentation/practice/add_book/add_book_page.dart';
import 'package:provider/provider.dart';

import 'book_list_model.dart';

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (context) => BookListModel()..fetchBook(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('本一覧'),
        ),
        body: Consumer<BookListModel>(
          builder: (context, model, child) {
            final books = model.books;
            final listTiles = books
                .map(
                  (book) => ListTile(
                    leading: (book.ImageUrl != '')
                        ? Image.network(book.ImageUrl)
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.grey,
                              width: 100.0,
                              height: 100.0,
                            ),
                          ),
                    title: Text(book.title),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        print('object');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddBookPage(book: book),
                            fullscreenDialog: true,
                          ),
                        );
                      },
                    ),
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('${book.title}を本当に削除しますか？'),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                Navigator.of(context).pop();
                                model.deleteBook(book);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('${book.title}を削除しました')));
                              },
                              child: Text('削除'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
                .toList();
            return ListView(
              children: listTiles,
            );
          },
        ),
        floatingActionButton:
            Consumer<BookListModel>(builder: (context, model, child) {
          model.fetchBook();
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddBookPage(),
                  fullscreenDialog: true,
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
