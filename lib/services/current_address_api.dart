import 'dart:convert';

import 'package:http/http.dart' as http;

 currentLocatioon() async {
  var url;
  url = await http.get(
    Uri.parse('https://us.puma.com/api/getUserLocation'),
  );
  var res = json.decode(url);
  return res["userCountry"];
}
