import 'package:frontend/domain/PrebuildCake.dart';
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

addMerchantPrebuildCakes(PrebuildCake cake) async {
  String path = "http://10.0.2.2:8080/api/prebuild_cake";
  var url = Uri.parse(path);

  var data = {
    "merchantId": cake.merchantId,
    "cakeName": cake.cakeName,
    "baseSizeId": cake.baseSizeId,
    "baseColorId": cake.baseColorId,
    "baseFlavorId": cake.baseFlavorId,
    "frostingColorId": cake.frostingColorId,
    "frostingFlavorId": cake.frostingFlavorId,
    "price": cake.price,
    "toppingIds": cake.toppingIds
  };

  var res = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: utf8.encode(json.encode(data)));

  return json.decode(res.body);
}

getPrebuildCakeById(int id) async {
  String path = "http://10.0.2.2:8080/api/prebuild_cake/" + id.toString();
  var url = Uri.parse(path);
  var res = await http.get(url);

  return json.decode(res.body);
}
