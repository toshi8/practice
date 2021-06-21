import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice/domain/book.dart';

class AddBookModel extends ChangeNotifier {
  String bookTitle = '';
  String imageUrl = '';

  File? galleryImage;
  bool isLoading = false;
  final picker = ImagePicker();

  Future addBookToFirebase() async {
    imageUrl = await uploadFile(galleryImage!.path);
    if (bookTitle.isEmpty) {
      throw ('タイトルを入力してください');
    }
    await FirebaseFirestore.instance.collection('books').add(
      {
        'title': bookTitle,
        'updateAt': DateTime.now(),
        'ImageUrl': imageUrl,
      },
    );
  }

  Future updateBook(Book book) async {
    final documentId =
        FirebaseFirestore.instance.collection('books').doc(book.documentId);
    imageUrl = await uploadFile(galleryImage!.path);

    await documentId.update(
      {
        'title': bookTitle,
        'ImageUrl': imageUrl,
        'updateAt': DateTime.now(),
      },
    );
  }

  Future getImage() async {
    try {
      print('tes');
      final _textController = TextEditingController();
      final pickedFile = await picker.getImage(source: ImageSource.gallery);

      // setState(() {
      if (pickedFile != null) {
        galleryImage = File(pickedFile.path);
        // print('getImage');
        // print(galleryImage!.path);
        // print(_image.writeAsString(_textController.text));
      } else {
        // print('No image selected.');
      }
      notifyListeners();
    } catch (e) {
      // print('No image selectedYes.');
    }
  }

  Future<String> uploadFile(String filePath) async {
    File file = File(filePath);
    var storage = FirebaseStorage.instance;

    try {
      TaskSnapshot snapshot =
          await storage.ref('books/$bookTitle.jpg').putFile(file);
      if (snapshot.state == TaskState.success) {
        final String downloadUrl = await snapshot.ref.getDownloadURL();
        return downloadUrl;
      }
      print('putFile');
    } catch (e) {
      print('errorFile');
    }
    return '';
  }

  Future startCircular() async {
    Container(
      color: Colors.grey.withOpacity(0.4),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
