import 'dart:convert';

import 'urls.dart';
import 'package:http/http.dart' as http;

class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final Map<String, dynamic>? body;
  final String? errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.body,
    this.errorMessage,
  });
}

class NetworkCaller {
  static const String _defaultErrorMessage = 'Something went wrong';

  static Future<NetworkResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
    bool isFromLogin = false,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      final response = await http.post(
        uri,
        body: jsonEncode(body),
        headers: {
          'content-type': 'application/json'
        },
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.statusCode);
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedJson,
        );
      } else {
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          body: decodedJson['user'] ?? _defaultErrorMessage,
        );
      }
    } catch (e) {
    
      print("Error occurred: $e");
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
      );
    }
  }
}
