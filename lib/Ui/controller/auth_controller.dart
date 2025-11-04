import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import '../../data/model/user_model.dart';

class AuthController {

  static UserModel? userModel;
  static String? accessToken;
  static final box = GetStorage();

  static const String _userDatakey = 'user-data';
  static const String _tokenkey = 'token';

  // ===================== Save user data =====================
  static Future<void> saveUserData(UserModel u_model, String token) async {
    await box.write(_userDatakey, jsonEncode(u_model.toJson()));
    await box.write(_tokenkey, token);

    // নতুন registration হলে flag true
    await box.write('is_new_registration', true);

    userModel = u_model;
    accessToken = token;
  }

  // ===================== Get user data =====================
  static Future<void> getUserData() async {
    final data = box.read(_userDatakey);
    if (data != null) {
      userModel = UserModel.fromJson(jsonDecode(data));
    }
    accessToken = box.read(_tokenkey);
  }

  // ===================== Check if logged in =====================
  static bool isUserLoggedIn() {
    String? token = box.read(_tokenkey);
    if (token != null) {
      getUserData();
      return true;
    }
    return false;
  }

  // ===================== Check if first time user =====================
  static Future<bool> isFirstTimeUser() async {
    bool? firstTime = box.read('is_first_time');
    if (firstTime == null) {
      await box.write('is_first_time', false);
      return true; // first-time user
    }
    return false; // already user
  }

  // ===================== Location =====================
  static Future<void> saveLocation(String location) async {
    await box.write('user_location', location);
    await box.write('is_location_set', true);

    // একবার location set হলে নতুন registration flag false করে দাও
    await box.write('is_new_registration', false);
  }

  static Future<bool> isLocationSet() async {
    bool? locationSet = box.read('is_location_set');
    return locationSet ?? false;
  }

  // ===================== New registration flag =====================
  static bool isNewRegistration() {
    return box.read('is_new_registration') ?? false;
  }

  // ===================== Clear user data on logout =====================
  static Future<void> clearData() async {
    await box.remove(_userDatakey);
    await box.remove(_tokenkey);
    // লোকেশন data রাখা হবে, পুরনো ইউজারের জন্য
    // await box.remove('user_location');
    // await box.remove('is_location_set');

    accessToken = null;
    userModel = null;
  }
}
