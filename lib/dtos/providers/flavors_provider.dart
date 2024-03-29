import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:pandeli_app/dtos/providers/token_provider.dart';
import 'package:pandeli_app/dtos/response/flavor_response_dto.dart';
import 'package:pandeli_app/services/base_uri.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlavorsProvider extends ChangeNotifier {
  bool isLoading = true;
  bool isError = false;

  Future getToken() async {
    final prefs = await SharedPreferences.getInstance();

    final tokenProvider = TokenProvider(prefs).getToken();
    return tokenProvider;
  }

  final logger = Logger();

  List<FlavorResponseDto>? _flavors;
  List<FlavorResponseDto>? get flavors => _flavors;

  Future fetchFlavors() async {
    try {
      final token = await getToken();

      final response = await http.get(
        Uri.parse('$baseUrl/api/breadflavors/1/10'),
        headers: {
          'Authorization': '$token',
        },
      );

      logger.d(response.body);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final List<dynamic> data = json['breadFlavors']['docs'];

        _flavors =
            data.map((design) => FlavorResponseDto.fromMap(design)).toList();
        isLoading = false;
        isError = false;

        notifyListeners();
      } else {
        _flavors = [];
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      logger.d(e);
    }
  }
}
