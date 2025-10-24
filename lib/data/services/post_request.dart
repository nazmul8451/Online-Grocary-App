import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user_model.dart';
import 'urls.dart';

class ApiService {
  // signup method
  static Future<UserModel?> signUp({required String name, required String email, required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(Urls.registrationUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "name": name.trim(),
          "email": email.trim(),
          "password": password.trim(),
        }),
      );
      print("Response Code: ${response.statusCode}");
      print("Response Body: ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        final userJson = jsonResponse['data']['user'];
        return UserModel.fromJson(userJson);
      } else {
        print("Signup failed: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Signup error: $e");
      return null;
    }
  }
}
