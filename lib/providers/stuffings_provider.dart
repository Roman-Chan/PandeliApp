import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:pandeli_app/dtos/response/stuffing_response_dto.dart';

class StuffingsProvider extends ChangeNotifier {
  bool isLoading = true;
  bool isError = false;

  final logger = Logger();

  List<StuffingResponseDto>? _stuffings;
  List<StuffingResponseDto>? get stuffings => _stuffings;

  Future fetchStuffings() async {
    try {
      const String token =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZjZkYWEyNWU0YWQ5MjY2ZjdmMGIyNyIsImlhdCI6MTY3NzM3MzY0MSwiZXhwIjoxNjc3NDYwMDQxfQ.CMhm6sUKmt1lyf4yUM3i2WxXt1RQQOMWojSC4Ng20Fk';

      // logger.d(Uri.parse('http://192.168.100.10:3000/api/cakedesigns'));

      final response = await http.get(
        Uri.parse('http://192.168.100.10:3000/api/stuffings'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      logger.d(response.body);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final List<dynamic> data = json;

        _stuffings =
            data.map((design) => StuffingResponseDto.fromMap(design)).toList();
        isLoading = false;
        isError = false;

        notifyListeners();
      }
    } catch (e) {
      logger.d(e);
    }
  }
}
