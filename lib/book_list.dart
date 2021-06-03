import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('books').snapshots();

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      appBar: AppBar(
        title: Text('本一覧'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          var fireDocuments = snapshot.data!.docs;
          return ListView.builder(
            itemCount: fireDocuments.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(fireDocuments[index]["title"]),
              );
            },
          );

          // return ListView(
          //     // children: snapshot.data!.docs.map((DocumentSnapshot document) {
          //     // children: documents.map((document) {
          //     // children: documents.map((document) {
          //     //   print(document);
          //     //   print(document.data());
          //     //   return ListTile(
          //     //     title: Text(
          //     //       'test',
          //     //     ),
          //     //   );
          //     // }).toList(),
          //     );
        },
      ),
    );
  }
}
