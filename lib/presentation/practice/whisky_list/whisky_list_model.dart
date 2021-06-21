// class WhiskyListModel extends ChangeNotifier {
//   String text = '';
//   bool error = false, dataloaded = false;
//
//   var data;
//
//   Future<List> fetchWhisky() async {
//     final String dataurl = "https://whisky-no-hi.com/flutter_api/list";
//     var res = await http.post(Uri.parse(dataurl));
//     if (res.statusCode == 200) {
//       data = json.decode(res.body);
//       dataloaded = true;
//     }
//
//     // final response =
//     //     await http.get("https://whisky-no-hi.com/flutter_api/list");
//
//     this.text = await 'yes';
//     notifyListeners();
//     return await data[0];
//   }
// }
