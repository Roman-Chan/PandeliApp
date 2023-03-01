import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:pandeli_app/dtos/providers/token_provider.dart';
import 'package:pandeli_app/dtos/response/orders_response_dto.dart';
import 'package:pandeli_app/services/base_uri.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersProvider extends ChangeNotifier {
  bool isLoading = true;
  bool isError = false;

  Future getToken() async {
    final prefs = await SharedPreferences.getInstance();

    final tokenProvider = TokenProvider(prefs).getToken();
    return tokenProvider;
  }

  final logger = Logger();

  List<OrderResponseDto>? _orders;
  List<OrderResponseDto>? get orders => _orders;
  
  Future fetchOrders() async {
    try {
      final token = await getToken();
      final response = await http.get(
        Uri.parse('$baseUrl/api/order/1/1'),
        headers: {
          'Authorization': '$token',
        },
      );
      logger.d(response.body);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final List<dynamic> data = json['order']['docs'];

        _orders =
            data.map((design) => OrderResponseDto.fromMap(design)).toList();
        isLoading = false;
        isError = false;

        notifyListeners();
      } 
    } catch (e) {
      logger.d(e);
    }
  }
}
