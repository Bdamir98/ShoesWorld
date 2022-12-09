import 'package:http/http.dart' as http;
import 'dart:convert';

Future fetchNike() async {
  var url;
  url = await http.get(
    Uri.parse(
        "https://api.nike.com/cic/browse/v2?queryid=products&anonymousId=62E5BD3DBEE8B762F0BFE444501DE52B&country=us&endpoint=%2Fproduct_feed%2Frollup_threads%2Fv2%3Ffilter%3Dmarketplace(US)%26filter%3Dlanguage(en)%26filter%3DemployeePrice(true)%26filter%3DattributeIds(0f64ecc7-d624-4e91-b171-b83a03dd8550%2C16633190-45e5-4830-a068-232ac7aea82c)%26anchor%3D24%26consumerChannelId%3Dd9a5bc42-4b9c-4976-858a-f159cf99c647%26count%3D24&language=en&localizedRangeStr=%7BlowestPrice%7D%20%E2%80%94%20%7BhighestPrice%7D"),
  );
  var res = json.decode(url.body);
  return res["data"]['products']['products'];
}
