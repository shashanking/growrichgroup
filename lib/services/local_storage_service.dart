import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _isVerifiedKey = 'isVerified';

  Future<bool> getIsVerified() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isVerifiedKey) ?? false;
  }

  Future<void> setIsVerified(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isVerifiedKey, value);
  }
}
