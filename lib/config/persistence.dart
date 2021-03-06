import 'package:shared_preferences/shared_preferences.dart';

class Persistence {

  static Future<String> load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return (prefs.getString('store') ?? "");
  }

  static void store(String content) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('store', content);
  }

}
