import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pandeli_app/dtos/providers/token_provider.dart';
import 'package:pandeli_app/dtos/response/design_response_dto.dart';
import 'package:pandeli_app/dtos/response/flavor_response_dto.dart';
import 'package:pandeli_app/dtos/response/size_response_dto.dart';
import 'package:pandeli_app/dtos/response/stuffing_response_dto.dart';
import 'package:pandeli_app/services/base_uri.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class OrderProvider extends ChangeNotifier {
  final logger = Logger();

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

  bool _isComplete = false;
  bool get isComplete => _isComplete;

  clearOptions() {
    _design = null;
    _flavor = null;
    _size = null;
    _stuffing = null;
    _order = {};
    _deliveriDate = '';

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
    };

    if (_design != null &&
        _size != null &&
        _flavor != null &&
        _stuffing != null &&
        _deliveriDate != '') _isComplete = true;

    notifyListeners();
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

      logger.d(response.body);
    } catch (e) {
      logger.d(e);
    }

    return false;
  }
}
