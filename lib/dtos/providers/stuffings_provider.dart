import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:pandeli_app/dtos/providers/token_provider.dart';
import 'package:pandeli_app/dtos/response/stuffing_response_dto.dart';
import 'package:pandeli_app/services/base_uri.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StuffingsProvider extends ChangeNotifier {
  bool isLoading = true;
  bool isError = false;

  Future getToken() async {
    final prefs = await SharedPreferences.getInstance();

    final tokenProvider = TokenProvider(prefs).getToken();
    return tokenProvider;
  }

  final logger = Logger();

  List<StuffingResponseDto>? _stuffings;
  List<StuffingResponseDto>? get stuffings => _stuffings;

  Future fetchStuffings() async {
    try {
      final token = await getToken();

      final response = await http.get(
        Uri.parse('$baseUrl/api/stuffings/1/10'),
        headers: {
          'Authorization': '$token',
        },
      );

      logger.d(response.body);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final List<dynamic> data = json['stuffings']['docs'];

        _stuffings =
            data.map((design) => StuffingResponseDto.fromMap(design)).toList();
        isLoading = false;
        isError = false;

        notifyListeners();
      } else {
        _stuffings = [];
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      logger.d(e);
    }
  }
}
