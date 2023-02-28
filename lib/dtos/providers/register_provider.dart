import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pandeli_app/services/base_uri.dart';

class RegisterProvider extends ChangeNotifier {
  late SharedPreferences _prefs;
  Future<bool> register(name,lastName,email, password) async {
    _prefs = await SharedPreferences.getInstance();
    final url = Uri.parse('$baseUrl/api/signup');
      final response = await http.post(url, body: {
        'name':name,
        'lastName': lastName,
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        final token = json.decode(response.body);
        _prefs.setString('bearer','bearer $token');
        return true;
      } else {
        final errorMessage = json.decode(response.body)['message'];
        throw Exception(errorMessage);
      }
  }
}