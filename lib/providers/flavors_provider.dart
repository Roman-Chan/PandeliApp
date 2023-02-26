import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:pandeli_app/dtos/response/flavor_response_dto.dart';

class FlavorsProvider extends ChangeNotifier {
  bool isLoading = true;
  bool isError = false;

  final logger = Logger();

  List<FlavorResponseDto>? _flavors;
  List<FlavorResponseDto>? get flavors => _flavors;

  Future fetchFlavors() async {
    try {
      const String token =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZjZkYWEyNWU0YWQ5MjY2ZjdmMGIyNyIsImlhdCI6MTY3NzM3MzY0MSwiZXhwIjoxNjc3NDYwMDQxfQ.CMhm6sUKmt1lyf4yUM3i2WxXt1RQQOMWojSC4Ng20Fk';

      // logger.d(Uri.parse('http://192.168.100.10:3000/api/cakedesigns'));

      final response = await http.get(
        Uri.parse('http://192.168.100.10:3000/api/breadflavors'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      logger.d(response.body);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final List<dynamic> data = json;

        _flavors =
            data.map((design) => FlavorResponseDto.fromMap(design)).toList();
        isLoading = false;
        isError = false;

        notifyListeners();
      }
    } catch (e) {
      logger.d(e);
    }
  }
}
