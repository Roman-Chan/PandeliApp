import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:pandeli_app/dtos/providers/token_provider.dart';
import 'package:pandeli_app/dtos/response/orders_response_dto.dart';
import 'package:pandeli_app/services/base_uri.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pandeli_app/dtos/response/design_response_dto.dart';
import 'package:pandeli_app/dtos/response/flavor_response_dto.dart';
import 'package:pandeli_app/dtos/response/size_response_dto.dart';
import 'package:pandeli_app/dtos/response/stuffing_response_dto.dart';

class OrdersProvider extends ChangeNotifier {
  bool isLoading = true;
  bool isError = false;

  /* OrderOptions */

  Map _order = {};
  Map get order => _order;

  DesignResponseDto? _design;
  DesignResponseDto? get design => _design;
  set design(DesignResponseDto? newDesign) {
    _design = newDesign;
    notifyListeners();
  }

  FlavorResponseDto? _flavor;
  FlavorResponseDto? get flavor => _flavor;
  set flavor(FlavorResponseDto? newFlavor) {
    _flavor = newFlavor;
    notifyListeners();
  }

  SizeResponseDto? _size;
  SizeResponseDto? get size => _size;
  set size(SizeResponseDto? newSize) {
    _size = newSize;
    notifyListeners();
  }

  StuffingResponseDto? _stuffing;
  StuffingResponseDto? get stuffing => _stuffing;
  set stuffing(StuffingResponseDto? newStuffing) {
    _stuffing = newStuffing;
    notifyListeners();
  }

  String _deliveriDate = '';
  String get getDeliveriDate => _deliveriDate;
  set deliveriDate(String deliveriDate) {
    _deliveriDate = deliveriDate;
    notifyListeners();
  }

  int? _address;
  int? get address => _address;
  set address(int? newAddress) {
    _address = newAddress;
    notifyListeners();
  }

  int _subtotal = 0;
  int get subtotal => _subtotal;

  bool _isComplete = false;
  bool get isComplete => _isComplete;

  /* Order API methods*/

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
      final prefs = await SharedPreferences.getInstance();
      final id = TokenProvider(prefs).getid();

      final token = await getToken();
      final response = await http.get(
        Uri.parse('$baseUrl/api/order/$id/1/15'),
        headers: {
          'Authorization': '$token',
        },
      );
      logger.d(id);
      logger.d(Uri.parse('$baseUrl/api/order/$id/1/10'));

      logger.d(response.body);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final List<dynamic> data = json['selectedData'];

        _orders =
            data.map((design) => OrderResponseDto.fromMap(design)).toList();
        isLoading = false;
        isError = false;
        notifyListeners();
      } else {
        _orders = [];
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      logger.d(e);
    }
  }

  Future<bool> postOrder() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = TokenProvider(prefs).getToken();

      final response = await http.post(
        Uri.parse('$baseUrl/api/order'),
        headers: {
          'Authorization': token,
        },
        body: _order,
      );

      if (response.statusCode != 200) {
        return false;
      }

      fetchOrders();
      return true;
    } catch (e) {
      logger.d(e);
      return false;
    }
  }

  /* Options Manager method */
  clearOptions() {
    _design = null;
    _flavor = null;
    _size = null;
    _stuffing = null;
    _order = {};
    _deliveriDate = '';
    _address = 0;

    _subtotal = 0;
    _isComplete = false;
    notifyListeners();
  }

  createOrder() async {
    final prefs = await SharedPreferences.getInstance();
    final id = TokenProvider(prefs).getid();

    _order = {
      'id_user': id,
      'id_design': _design!.id,
      'id_size': _size!.id,
      'id_flavor': _flavor!.id,
      'id_stuffing': _stuffing!.id,
      'date': _deliveriDate,
      'address': '$_address',
    };

    if (_design != null &&
        _size != null &&
        _flavor != null &&
        _stuffing != null &&
        _deliveriDate != '' &&
        _address != null) _isComplete = true;

    notifyListeners();
  }

  calcSubtotal() {
    _subtotal =
        _design!.price + _size!.price + _flavor!.price + _stuffing!.price;
    ChangeNotifier();
  }
}
