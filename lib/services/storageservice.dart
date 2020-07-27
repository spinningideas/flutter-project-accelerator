import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  void setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  void removeString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, null);
  }
}
