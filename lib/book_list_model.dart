import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'book.dart';

class BookListModel extends ChangeNotifier {
  List<Book> books = [];

  Future fetchBook() async {
    final docs = await FirebaseFirestore.instance.collection('books').get();
    final bookes = docs.docs.map((doc) => Book(doc['title'])).toList();
    this.books = bookes;
    notifyListeners();
  }
}
