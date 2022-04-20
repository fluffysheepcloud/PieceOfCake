import 'package:http/http.dart' as http;
import 'dart:convert';
const String baseURL = "http://10.0.2.2:8080/api/prebuild";

// returns all prebuilt cakes of a specific merchant
getMerchantPrebuildCakes(int id) async {
  String path = "/" + id.toString();

  var url = Uri.parse(baseURL + path);
  var res = await http.get(url);

  return json.decode(res.body);
}

