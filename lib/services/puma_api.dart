import 'dart:convert';

import 'package:http/http.dart' as http;

Future fetchReebok() async {
  var url;
  url = await http.get(
    Uri.parse(
        "https://www.reebok.com/api/plp/content-engine?sitePath=us&query=men-shoes&start=48"),
  );
  var res = json.decode(url.body);
  return res["raw"]["itemList"]["items"];
}
