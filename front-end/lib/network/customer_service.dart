import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseURL = "http://10.0.2.2:8080/api/customer";

customerLogin(String username, String password) async {
  String path = "/login";

  var url = Uri.parse(baseURL + path);
  var res =  await http.post(url,
      body: {
        'username': username,
        'password': password
      });

  return json.decode(res.body);
}

// customerRegister()