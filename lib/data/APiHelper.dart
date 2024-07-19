import 'dart:convert';
import 'package:http/http.dart' as http;


class ApiHelper {



  static const String baseUrl = 'https://attendancesystem-s1.onrender.com/api/';

  static Future<http.Response> get(String endpoint, {Map<String, String>? headers}) async {
    final Uri uri = Uri.parse(baseUrl + endpoint);
    return await http.get(uri, headers: headers);
  }

  static Future<http.Response> post(String endpoint, {Map<String, String>? headers, dynamic body}) async {
    final Uri uri = Uri.parse(baseUrl + endpoint);
    return await http.post(uri, headers: headers, body: body);
  }
}
