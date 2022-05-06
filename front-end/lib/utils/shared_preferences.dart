import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class SPUtil {

  static int loginStatus = -1;

  static const unknownCustomer = {
    "id": -1,
    "username": "Unknown",
    "nickName": "Unknown",
    "password": "Unknown",
    "email": "Unknown",
    "phone": "Unknown"
  };

  static const unknownMerchant = {
    "id": -1,
    "username": "Unknown",
    "shopName": "Unknown",
    "password": "Unknown",
    "email": "Unknown",
    "phone": "Unknown",
    "description": "Unknown",
    "businessHour": "Unknown"
  };

  static Future<Map> getUserData() async {
    if (loginStatus == 0) {
      String? data = await getString("customer");
      return data == null ? unknownCustomer :
          json.decode(data);
    }
    else if (loginStatus == 1) {
      String? data = await getString("merchant");
      return data == null ? unknownMerchant :
      json.decode(data);
    }
    else {
      return {};
    }
  }

  static updateLoginStatus() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? customerStat = sp.getString("customer");
    String? merchantStat = sp.getString("merchant");

    if(customerStat != null) {
      loginStatus = 0;
    }
    else if (merchantStat != null) {
      loginStatus = 1;
    }
    else {
      loginStatus = -1;
    }
  }

  static Future<String?> getString(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }

  static setString(String key, String value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  static remove(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }

  static addCake(int cakeId, int quantity) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    if (sp.getString("cake") == null) {
      Map m = {};
      m[cakeId.toString()] = quantity;
      String encodeValue  = json.encode(m);
      await sp.setString("cake", encodeValue);
      return;
    }
    String? string = sp.getString("cake");
    if (string != null) {
      Map m = json.decode(string);
      m[cakeId.toString()] = quantity;
      String encodeValue  = json.encode(m);
      await sp.setString("cake", encodeValue);
      return;
    }
  }

  static Future<Map<dynamic, dynamic>> getCakes() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (sp.get("cake") == null) return {};

    String? str = sp.getString("cake");
    if (str != null) {
      return json.decode(str) as Map;
    }

    return {};
  }

  static clearCakes() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove("cake");
  }

  static removeCake(int id) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    Map m = await getCakes();
    m.remove(id.toString());
    String encodeValue  = json.encode(m);
    await sp.setString("cake", encodeValue);
  }

  static subtractCake(int id) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    Map m = await getCakes();
    m[id.toString()] -= 1;
    String encodeValue  = json.encode(m);
    await sp.setString("cake", encodeValue);
  }

  static incrementCake(int id) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    Map m = await getCakes();
    m[id.toString()] += 1;
    String encodeValue  = json.encode(m);
    await sp.setString("cake", encodeValue);
  }


 }