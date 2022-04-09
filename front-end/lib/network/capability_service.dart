import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseURL = "http://10.0.2.2:8080/api/merchant";

updateMerchantBaseSize(int bsId, double price) async {
  String path = "/capability/cake_base";

  var uri = Uri.parse(baseURL + path);
  var res = await http.put(uri, body: {
    "id": bsId.toString(),
    "price": price.toString()
  });

  return json.decode(res.body);
}

updateMerchantBaseColor(int bcId, double price) async {
  String path = "/capability/base_color";

  var uri = Uri.parse(baseURL + path);
  var res = await http.put(uri, body: {
    "id": bcId.toString(),
    "price": price.toString()
  });

  return json.decode(res.body);
}

updateMerchantBaseFlavor(int bfId, double price) async {
  String path = "/capability/base_flavor";

  var uri = Uri.parse(baseURL + path);
  var res = await http.put(uri, body: {
    "id": bfId.toString(),
    "price": price.toString()
  });

  return json.decode(res.body);
}

updateMerchantFrostingColor(int fcId, double price) async {
  String path = "/capability/frosting_color";

  var uri = Uri.parse(baseURL + path);
  var res = await http.put(uri, body: {
    "id": fcId.toString(),
    "price": price.toString()
  });

  return json.decode(res.body);
}

updateMerchantFrostingFlavor(int ffId, double price) async {
  String path = "/capability/frosting_flavor";

  var uri = Uri.parse(baseURL + path);
  var res = await http.put(uri, body: {
    "id": ffId.toString(),
    "price": price.toString()
  });

  return json.decode(res.body);
}

updateMerchantTopping(int tpId, double price) async {
  String path = "/capability/topping";

  var uri = Uri.parse(baseURL + path);
  var res = await http.put(uri, body: {
    "id": tpId.toString(),
    "price": price.toString()
  });

  return json.decode(res.body);
}

addMerchantBaseSize(int mId, String size, String price) async {
  String path = "/capability/cake_base";

  var uri = Uri.parse(baseURL + path);
  var res = await http.post(uri, body: {
    "mId": mId.toString(),
    "name": size,
    "price": price
  });

  return json.decode(res.body);
}

addMerchantBaseColor(int mId, String color, String price) async {
  String path = "/capability/base_color";

  var uri = Uri.parse(baseURL + path);
  var res = await http.post(uri, body: {
    "mId": mId.toString(),
    "name": color,
    "price": price
  });

  return json.decode(res.body);
}

addMerchantBaseFlavor(int mId, String flavor, String price) async {
  String path = "/capability/base_flavor";

  var uri = Uri.parse(baseURL + path);
  var res = await http.post(uri, body: {
    "mId": mId.toString(),
    "name": flavor,
    "price": price
  });

  return json.decode(res.body);
}

addMerchantFrostingColor(int mId, String frostingColor, String price) async {
  String path = "/capability/frosting_color";

  var uri = Uri.parse(baseURL + path);
  var res = await http.post(uri, body: {
    "mId": mId.toString(),
    "name": frostingColor,
    "price": price
  });

  return json.decode(res.body);
}

addMerchantFrostingFlavor(int mId, String frostingFlavor, String price) async {
  String path = "/capability/frosting_flavor";

  var uri = Uri.parse(baseURL + path);
  var res = await http.post(uri, body: {
    "mId": mId.toString(),
    "name": frostingFlavor,
    "price": price
  });

  return json.decode(res.body);
}

addMerchantTopping(int mId, String topping, String price) async {
  String path = "/capability/topping";

  var uri = Uri.parse(baseURL + path);
  var res = await http.post(uri, body: {
    "mId": mId.toString(),
    "name": topping,
    "price": price
  });

  return json.decode(res.body);
}

removeMerchantBaseSize(int id) async {
  String path = "/capability/cake_base/";

  path = path + id.toString();
  var uri = Uri.parse(baseURL + path);
  var res = await http.delete(uri);

  return json.decode(res.body);
}

removeMerchantBaseColor(int id) async {
  String path = "/capability/base_color/";

  path = path + id.toString();
  var uri = Uri.parse(baseURL + path);
  var res = await http.delete(uri);

  return json.decode(res.body);
}

removeMerchantBaseFlavor(int id) async {
  String path = "/capability/base_flavor/";

  path = path + id.toString();
  var uri = Uri.parse(baseURL + path);
  var res = await http.delete(uri);

  return json.decode(res.body);
}

removeMerchantFrostingColor(int id) async {
  String path = "/capability/frosting_color/";

  path = path + id.toString();
  var uri = Uri.parse(baseURL + path);
  var res = await http.delete(uri);

  return json.decode(res.body);
}

removeMerchantFrostingFlavor(int id) async {
  String path = "/capability/frosting_flavor/";

  path = path + id.toString();
  var uri = Uri.parse(baseURL + path);
  var res = await http.delete(uri);

  return json.decode(res.body);
}

removeMerchantTopping(int id) async {
  String path = "/capability/topping/";

  path = path + id.toString();
  var uri = Uri.parse(baseURL + path);
  var res = await http.delete(uri);

  return json.decode(res.body);
}
