import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseURL = "http://10.0.2.2:8080/api/merchant";

getMerchantInfoById(int id) async {
  // String path = "/" + id.toString();

  var uri = Uri.parse(baseURL + "/" + "1");
  var res = await http.get(uri);

  return json.decode(res.body);
}