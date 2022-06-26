import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BackEndRequests {
  // post request for authenticating user and getting response and return that response where function is being called
  static Future<http.Response> loginRequest(
      String email, String password, String token, BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://buddy.ropstambpo.com/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'device_token': token,
      }),
    );
    return response;
  }

  // get request to fetch data from API return response where function is being called
  static Future<http.Response> getListData() async {
    var response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/Posts'),
    );

    return response;
  }
}
