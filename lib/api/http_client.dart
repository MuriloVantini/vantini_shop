import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class MyHttpClient {
  // static const baseUrl = "http://192.168.18.4:8000/api";
  static const baseUrl = "http://172.16.0.13:8000/api";

  static Map<String, String> getHeaders({String? token}) {
    final headers = {
      HttpHeaders.acceptHeader: 'application/json',
      // HttpHeaders.contentTypeHeader: 'application/json',
    };
    if (token != null) {
      headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }
    return headers;
  }

  static Future<http.Response> get({
    required String url,
    required Map<String, String> headers,
  }) async {
    final response = await http.get(
      Uri.parse(baseUrl + url),
      headers: headers,
    );

    return response;
  }

  static Future<http.Response> post({
    required String url,
    required Map<String, String> headers,
    Map<String, String>? body,
  }) async {
    final response = await http.post(
      Uri.parse(baseUrl + url),
      headers: headers,
      body: body,
    );
    return response;
  }

  static Future<http.Response> postString({
    required String url,
    required Map<String, String> headers,
    Map<String, dynamic>? body,
  }) async {
    final response = await http.post(
      Uri.parse(baseUrl + url),
      headers: headers,
      body: json.encode(body),
    );
    return response;
  }

  static Future<http.Response> put({
    required String url,
    required Map<String, String> headers,
    Map<String, String>? body,
  }) async {
    final response = await http.put(
      Uri.parse(baseUrl + url),
      headers: headers,
      body: body,
    );
    return response;
  }

  static Future<http.Response> delete({
    required String url,
    required Map<String, String> headers,
  }) async {
    final response = await http.delete(
      Uri.parse(baseUrl + url),
      headers: headers,
    );
    return response;
  }
}
