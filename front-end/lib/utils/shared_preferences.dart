import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

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

  static void setString(String key, String value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  static void remove(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }

 }