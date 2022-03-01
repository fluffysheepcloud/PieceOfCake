import 'package:frontend/domain/customer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseURL = "http://10.0.2.2:8080/api/customer";

// Service for customer login
customerLogin(String username, String password) async {
  String path = "/login";

  var url = Uri.parse(baseURL + path);
  var res =  await http.post(url,
      body: {
        "username": username,
        "password": password
      });

  return json.decode(res.body);
}

// Service for customer register
customerRegister(Customer c) async {
  String path = "/register";

  var url = Uri.parse(baseURL + path);
  var res = await http.post(url,
    body: {
      "username": c.username,
      "nickName": c.nickName,
      "password": c.password,
      "email": c.email,
      "phone": c.phone
    }
  );

  return json.decode(res.body);
}

updateCustomerInfo(Map c) async {
  String path = "";

  var url = Uri.parse(baseURL + path);
  var res = await http.put(url,
    body: {
      "id": c["id"].toString(),
      "username": c["username"],
      "nickName": c["nickName"],
      "password": c["password"],
      "email": c["email"],
      "phone": c["phone"]
    }
  );

  return json.decode(res.body);
}