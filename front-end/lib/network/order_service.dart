import 'package:http/http.dart' as http;
import 'dart:convert';
const String baseURL = "http://10.0.2.2:8080/api/order";

pureCakeRequest(
    String cId,
    String mId,
    String name,
    String phone,
    String email,
    String des) async
{
  String path = "/pure_cake";
  var url = Uri.parse(baseURL + path);
  var res = await http.post(url,
    body: {
      "cId": cId,
      "mId": mId,
      "name": name,
      "phone": phone,
      "email": email,
      "des": des
    }
  );

  return json.decode(res.body)["code"];
}
