import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  Book(DocumentSnapshot doc, Map docData) {
    documentId = doc.id;
    title = docData['title'];
    if (docData['ImageUrl'] != null) {
      ImageUrl = docData['ImageUrl'];
    }
  }

  String title = '';
  String documentId = '';
  String ImageUrl = '';
}
