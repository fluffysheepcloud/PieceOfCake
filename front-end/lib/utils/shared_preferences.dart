import 'package:shared_preferences/shared_preferences.dart';

class SPUtil {


  static Future<int> getLoginState() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? customerStat = sp.getString("customer");
    String? merchantStat = sp.getString("merchant");

    if(customerStat != null) {
      return 0;
    }
    else if (merchantStat != null) {
      return 1;
    }
    else {
      return -1;
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