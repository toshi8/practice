import 'package:flutter/material.dart';
import 'package:practice/video_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final items = List<String>.generate(14, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        titleSpacing: 0.0,
        title: Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  'youtube',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        leading: Icon(
          Icons.video_call_rounded,
          color: Colors.red,
          size: 30.0,
        ),
        actions: <Widget>[
          Icon(
            Icons.search_sharp,
            color: Colors.black,
            size: 30.0,
          ),
          Icon(
            Icons.more_vert,
            color: Colors.black,
            size: 30.0,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return ListTile(
              // title: Text('${items[index]}'),
              title: Row(
                children: <Widget>[
                  Image.network(
                    'https://s3.whisky-img.com/page_icon/medium/955.png',
                    width: 55,
                    height: 55,
                  ),
                  Column(
                    children: [
                      ConstrainedBox(
                        constraints:
                            BoxConstraints(maxWidth: 320.0, maxHeight: 64.0),
                        child: Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 8,
                            ),
                            child: Text(
                              'ウイスキー大学',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.video_call_rounded,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    'チャンネル登録',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2),
                              child: Text(
                                'チャンネル登録者数 76900人',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return ListTile(
            leading: Image.network(
              'https://s3.whisky-img.com/createThumbnail/medium/46.jpg',
              width: 100,
              height: 90,
            ),
            title: Text('Firebase Firestoreのセキュリティルール勉強会 by Kosuke'),
            subtitle: Text('296 回視聴・2日前'),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                print('onTapIcon');
              },
            ),
            onTap: () => {
              print('onTap'),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VideoPage()),
              ),
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department),
            label: '急上昇',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: '登録チャンネル',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'ライブリラリ',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
