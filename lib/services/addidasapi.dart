import 'package:http/http.dart' as http;
import 'dart:convert';

Future fetcAddidas() async {
  var url;
  url = await http.get(
    Uri.parse(
        "https://www.adidas.com/api/plp/content-engine?sitePath=us&query=men-shoes&start=48"),
  );
  var res = json.decode(url.body);
  return res["raw"]['itemList']['items'];
}
