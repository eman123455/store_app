import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    http.Response response = await http.get(Uri.parse(url));
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with a status code ${response.statusCode}');
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    // Add headers
    Map<String, String> header = {
      'Content-Type': 'application/json', // Ensure JSON content-type
    };
    if (token != null) {
      header
          .addAll({'Authorization': 'Bearer $token'}); // Add token if available
    }

    // Send POST request with JSON encoded body
    http.Response response = await http.post(Uri.parse(url),
        body: jsonEncode(body), headers: header);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with a status code ${response.statusCode} with body ${response.body}');
    }
  }

  Future<dynamic> put({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    // Add headers
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    print('url = $url body = $body token = $token ');
    http.Response response = await http.put(Uri.parse(url),
        body: jsonEncode(body), headers: headers);

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with a status code ${response.statusCode} with body ${response.body}');
    }
  }
}
