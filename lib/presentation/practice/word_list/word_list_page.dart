import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  var listItem = [1, 2, 3];

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 1));

    return Future.sync(() {
      setState(() {
        // listItem = listItem.map((item) => item + 1).toList();
        listItem.add(listItem.length + 1);
        listItem.add(listItem.length + 1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Test')),
      backgroundColor: Colors.grey,
      body: RefreshIndicator(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Padding(
                child: Text(
                  listItem[index].toString(),
                  style: TextStyle(fontSize: 22.0),
                ),
                padding: EdgeInsets.all(20.0),
              ),
            );
          },
          itemCount: listItem.length,
        ),
        onRefresh: _refresh,
      ),
    );
  }
}
