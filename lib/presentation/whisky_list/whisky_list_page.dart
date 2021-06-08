import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WhiskyListPage extends StatefulWidget {
  @override
  WhiskyListPageContent createState() {
    return WhiskyListPageContent();
  }
}

class WhiskyListPageContent extends State<WhiskyListPage> {
  bool error = false, dataloaded = false;
  var datas;
  final String dataurl = "https://whisky-no-hi.com/flutter_api/list";

  @override
  void initState() {
    loaddata();
    //calling loading of data
    super.initState();
  }

  void loaddata() {
    Future.delayed(Duration.zero, () async {
      var res = await http.post(Uri.parse(dataurl));
      if (res.statusCode == 200) {
        setState(() {
          datas = json.decode(res.body);
          dataloaded = true;
        });
      } else {
        setState(() {
          error = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(datas);
    // final listTiles = datas.forEach((pName) {
    //   // print(d['p_name']);
    //   ListTile(
    //     title: Text(pName['p_name']),
    //   );
    // });
    // print(listTiles);
    // final listTiles = datas.map((data) => ListTile(
    //       title: (data['p_name']),
    //     ));
    // print(listTiles);
    return Scaffold(
      appBar: AppBar(
        title: Text('ウイスキー一覧'),
      ),
      // body: ListView(
      //   children: [
      //     datas.forEach((pName) {
      //       return ListTile(
      //         title: Text(pName['p_name']),
      //       );
      //     }),
      //   ],
      // ),
      body: ListView.builder(
        itemCount: datas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${datas[index]['p_name']}'),
          );
        },
      ),
    );

    throw UnimplementedError();
  }
}
