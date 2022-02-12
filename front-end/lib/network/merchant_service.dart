import 'package:frontend/domain/merchant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseURL = "http://10.0.2.2:8080/api/merchant";

merchantLogin(String username, String password) async {
  String path = "/login";

  var url = Uri.parse(baseURL + path);
  var res =  await http.post(url,
      body: {
        "username": username,
        "password": password
      });

  return json.decode(res.body);
}

merchantRegister(Merchant m) async {
  String path = "/register";

  var url = Uri.parse(baseURL + path);
  var res = await http.post(url,
      body: {
        "username": m.username,
        "shopname": m.shopname,
        "password": m.password,
        "email": m.email,
        "phone": m.phone,
        "description": m.description,
        "businessHour": m.businessHour,
        "street": m.street,
        "city": m.city,
        "state": m.state,
        "zip": m.zip
      }
  );

  return json.decode(res.body);
}

getMerchantInfoById(int id) async {
  String path = "/" + id.toString();

  var uri = Uri.parse(baseURL + path);
  var res = await http.get(uri);

  return json.decode(res.body);
}