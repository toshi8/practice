import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../domain/book.dart';

class BookListModel extends ChangeNotifier {
  List<Book> books = [];

  // final Stream<QuerySnapshot> _booksStream =
  //     FirebaseFirestore.instance.collection('books').snapshots();
  //
  // @override
  // Widget build(BuildContext context) {
  //   return StreamBuilder<QuerySnapshot>(
  //     stream: _booksStream,
  //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //       if (snapshot.hasError) {
  //         return Text('Something went wrong');
  //       }
  //
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Text("Loading");
  //       }
  //
  //       return new ListView(
  //         children: snapshot.data!.docs.map((DocumentSnapshot document) {
  //           return new ListTile(
  //             title: new Text(document.data()['full_name']),
  //             subtitle: new Text(document.data()['company']),
  //           );
  //         }).toList(),
  //       );
  //     },
  //   );
  // }

  Future fetchBook() async {
    final docs = await FirebaseFirestore.instance.collection('books').get();
    final bookes = docs.docs.map((doc) => Book(doc['title'])).toList();
    this.books = bookes;
    notifyListeners();
  }

// Future fetchBook() async {
//   final docs = await FirebaseFirestore.instance.collection('books').get();
//   final bookes = docs.docs.map((doc) => Book(doc['title'])).toList();
//   this.books = bookes;
//   notifyListeners();
// }
}
