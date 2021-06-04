import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  Book(DocumentSnapshot doc) {
    documentId = doc.id;
    title = doc['title'];
  }

  String title = '';
  String documentId = '';
}
