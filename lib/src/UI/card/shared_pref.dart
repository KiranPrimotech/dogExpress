import 'package:shared_preferences/shared_preferences.dart';

class SharePreference {
  static setLastIndex(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastIndex', index);
  }

  static Future<int?> getLastIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('lastIndex');
  }

  static clear() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

  static addStringToSF(String key ,String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key , value);
  }

  static getStringValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString(key);
    return stringValue;
  }


  static addBoolToSF(String key ,bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key , value);
  }
  static getBoolValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    bool? boolValue = prefs.getBool(key);
    return boolValue;
  }


}
