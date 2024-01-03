import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static const String _keyUserId = 'user_id';

  static Future<void> setUserId(int? userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyUserId, userId ?? 0);
  }

  static Future<int> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyUserId) ?? 0;
  }
}
