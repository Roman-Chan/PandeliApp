import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pandeli_app/dtos/providers/token_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pandeli_app/services/base_uri.dart';

class LoginProvider extends ChangeNotifier {
  bool isloadin = false;
  Future<bool> login(email, password) async {
    final prefs = await SharedPreferences.getInstance();
    final tokenProvider = TokenProvider(prefs);
    final url = Uri.parse('$baseUrl/api/signin');
      final response = await http.post(url, body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        final token = json.decode(response.body)['token'];
        final id = json.decode(response.body)['_id'];
        tokenProvider.setToken(token);
        tokenProvider.setId(id);
        isloadin = false;
        return true;
      } else {
        final errorMessage = json.decode(response.body)['message'];
        throw Exception(errorMessage);

      }
  }
}