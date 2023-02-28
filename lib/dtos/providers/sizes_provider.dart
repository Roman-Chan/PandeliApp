import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:pandeli_app/dtos/providers/token_provider.dart';
import 'package:pandeli_app/dtos/response/size_response_dto.dart';
import 'package:pandeli_app/services/base_uri.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SizesProvider extends ChangeNotifier {
  bool isLoading = true;
  bool isError = false;

  Future getToken() async {
    final prefs = await SharedPreferences.getInstance();

    final tokenProvider = TokenProvider(prefs).getToken();
    return tokenProvider;
  }

  final logger = Logger();

  List<SizeResponseDto>? _sizes;
  List<SizeResponseDto>? get sizes => _sizes;

  Future fetchSizes() async {
    try {
      final token = await getToken();

      final response = await http.get(
        Uri.parse('$baseUrl/api/breadsizes?page=1'),
        headers: {
          'Authorization': '$token',
        },
      );

      logger.d(response.body);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final List<dynamic> data = json;

        _sizes = data.map((design) => SizeResponseDto.fromMap(design)).toList();
        isLoading = false;
        isError = false;

        notifyListeners();
      }
    } catch (e) {
      logger.d(e);
    }
  }
}
