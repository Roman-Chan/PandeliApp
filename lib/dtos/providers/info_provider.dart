import 'dart:convert';
/* import 'dart:developer'; */
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:pandeli_app/dtos/providers/token_provider.dart';
import 'package:pandeli_app/dtos/response/infoProfile_response.dto.dart';
import 'package:pandeli_app/services/base_uri.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoProvider extends ChangeNotifier {
  Future getToken() async {
    final prefs = await SharedPreferences.getInstance();

    final tokenProvider = TokenProvider(prefs).getToken();
    return tokenProvider;

  }

  final logger = Logger();

  UserResponseDto? _user;
  UserResponseDto? get user => _user;

  Future fetchUser() async{
    final prefs = await SharedPreferences.getInstance();
    final id = TokenProvider(prefs).getid();
    final token = await getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/api/user/$id'),
      headers: {
        'Authorization': '$token',
      }
    );
    if(response.statusCode == 200) {
      final json = jsonDecode(response.body);
      _user = UserResponseDto.fromMap(json);
      notifyListeners();
    } else {
      print('error');
    }
  }
}
