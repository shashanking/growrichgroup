import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _isVerifiedKey = 'isVerified';
  static const String _userIdKey = 'userId';
  static const String _usernameKey = 'username';
  static const String _phoneNumberKey = 'phoneNumber';
  static const String _emailIdKey = 'emailId';
  static const String _depositIdKey = 'depositId';
  static const String _temporaryPasswordKey = 'temporaryPassword';
  static const String _isFirstTimeKey = 'isFirstTime';
  static const String _panKey = 'pan';
  static const String _referredByKey = 'referredBy';
  static const String _referredIdsKey = 'referredIds';

  final SharedPreferences prefs;

  LocalStorageService(this.prefs);

  // Getters and Setters
  Future<void> setIsVerified(bool value) async {
    await prefs.setBool(_isVerifiedKey, value);
  }

  bool getIsVerified() {
    return prefs.getBool(_isVerifiedKey) ?? false;
  }

  Future<void> setUserId(String userId) async {
    await prefs.setString(_userIdKey, userId);
  }

  String getUserId() {
    return prefs.getString(_userIdKey) ?? '';
  }

  Future<void> setUsername(String username) async {
    await prefs.setString(_usernameKey, username);
  }

  String getUsername() {
    return prefs.getString(_usernameKey) ?? '';
  }

  Future<void> setPhoneNumber(String phoneNumber) async {
    await prefs.setString(_phoneNumberKey, phoneNumber);
  }

  String getPhoneNumber() {
    return prefs.getString(_phoneNumberKey) ?? '';
  }

  Future<void> setEmailId(String emailId) async {
    await prefs.setString(_emailIdKey, emailId);
  }

  String getEmailId() {
    return prefs.getString(_emailIdKey) ?? '';
  }

  Future<void> setDepositIds(List<String> depositIds) async {
    await prefs.setStringList(_depositIdKey, depositIds);
  }

  List<String> getDepositIds() {
    return prefs.getStringList(_depositIdKey) ?? [];
  }

  Future<void> setTemporaryPassword(String temporaryPassword) async {
    await prefs.setString(_temporaryPasswordKey, temporaryPassword);
  }

  String getTemporaryPassword() {
    return prefs.getString(_temporaryPasswordKey) ?? '123456';
  }

  Future<void> setIsFirstTime(bool isFirstTime) async {
    await prefs.setBool(_isFirstTimeKey, isFirstTime);
  }

  bool getIsFirstTime() {
    return prefs.getBool(_isFirstTimeKey) ?? true;
  }

  Future<void> setPan(String pan) async {
    await prefs.setString(_panKey, pan);
  }

  String getPan() {
    return prefs.getString(_panKey) ?? '';
  }

  Future<void> setReferredBy(String referredBy) async {
    await prefs.setString(_referredByKey, referredBy);
  }

  String getReferredBy() {
    return prefs.getString(_referredByKey) ?? '';
  }

  Future<void> setReferredIds(List<String> referredIds) async {
    await prefs.setStringList(_referredIdsKey, referredIds);
  }

  List<String> getReferredIds() {
    return prefs.getStringList(_referredIdsKey) ?? [];
  }
}
