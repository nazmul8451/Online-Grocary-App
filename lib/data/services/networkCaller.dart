import 'dart:convert';

import 'urls.dart';
import 'package:http/http.dart';

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
  static const String _unAuthorizeMessage = 'Un-authorized token';

  static Future<NetworkResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
    bool isFromLogin = false,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      final Map<String, String> headers = {
        'content-type': 'application/json',
        'Accept': 'application/json',
      };
      _logRequest;
      (url, body, headers);
      final response = await post(
        uri,
        body: jsonEncode(body),
        headers: headers,
      );
      logResponse(url, response);
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
      return NetworkResponse(isSuccess: false, statusCode: -1);
    }
  }

 static Future<NetworkResponse> getAllProducts({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, null, null);
      final response = await get(uri);
      logResponse(url, response);
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedData,
        );
      } else if (response.statusCode == 401) {
        //unauuthorize
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: _unAuthorizeMessage,
        );
      } else {
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: decodedJson['message'] ?? _defaultErrorMessage,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  static void _logRequest(
    String url,
    Map<String, String>? body,
    Map<String, String>? headers,
  ) {
    print(
      '=====================Request========================\n'
      'URL: $url \n'
      'BODY:$body \n'
      'HEADERS:$headers\n'
      '==================================================',
    );
  }

  static void logResponse(String url, Response response) {
    print(
      '=====================Response========================\n'
      'URL: $url \n'
      'BODY:${response.body}\n'
      'STATUS CODE:${response.statusCode}\n'
      '=================================================================',
    );
  }
}
