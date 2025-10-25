import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_grocery_app/data/model/user_model.dart';

class AuthController{

  static UserModel? userModel;
  static String? accessToken;

  static final box = GetStorage();
  static const String _userDatakey = 'user-data';
  static const String _tokenkey = 'token';

 static Future<void> saveUserData(UserModel u_model,String token)async{
    await box.write(_userDatakey, jsonEncode(u_model.toJson()));
    await box.write(_tokenkey, token);
    userModel = u_model;
    accessToken = token;
  }

 static Future<void> getUserData()async{
    userModel =  UserModel.fromJson(jsonDecode(box.read(_userDatakey)));
    accessToken =  box.read(_tokenkey);
  }

  static bool isUserLoggedIn() {
    String? token = box.read(_tokenkey);
    if (token != null) {
      getUserData();
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> isFirstTimeUser() async {
    bool? firstTime = box.read('is_first_time');
    if (firstTime == null) {
      await box.write('is_first_time', false);
      return true; // first-time
    }
    return false; // already user
  }


 static Future<void> clearData()async{
    await box.erase();
    accessToken = null;
    userModel = null;
  }

}