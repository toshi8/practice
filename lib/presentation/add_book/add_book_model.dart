import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/domain/book.dart';

class AddBookModel extends ChangeNotifier {
  String bookTitle = '';

  Future addBookToFirebase() async {
    if (bookTitle.isEmpty) {
      throw ('タイトルを入力してください');
    }
    await FirebaseFirestore.instance.collection('books').add(
      {
        'title': bookTitle,
        'updateAt': DateTime.now(),
      },
    );
  }

  Future updateBook(Book book) async {
    final documentId =
        FirebaseFirestore.instance.collection('books').doc(book.documentId);

    await documentId.update(
      {
        'title': bookTitle,
        'updateAt': DateTime.now(),
      },
    );
  }
}
