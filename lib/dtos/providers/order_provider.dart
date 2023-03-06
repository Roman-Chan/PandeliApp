import 'package:flutter/material.dart';
import 'package:pandeli_app/dtos/providers/token_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderProvider extends ChangeNotifier {
  Map _order = {};
  Map get order => _order;

  String _design = '';
  String get getDesign => _design;
  set design(String design) {
    _design = design;
    notifyListeners();
  }

  String _flavor = '';
  String get getFlavor => _flavor;
  set flavor(String flavor) {
    _flavor = flavor;
    notifyListeners();
  }

  String _size = '';
  String get getSize => _size;
  set size(String size) {
    _size = size;
    notifyListeners();
  }

  String _stuffing = '';
  String get getStuffing => _stuffing;
  set stuffing(String stuffing) {
    _stuffing = stuffing;
    notifyListeners();
  }

  createOrder() async {
    final prefs = await SharedPreferences.getInstance();
    final id = TokenProvider(prefs).getid();

    _order = {
      'userId': id,
      'id_design': _design,
      'id_size': _size,
      'id_flavor': _flavor,
      'id_stuffing': _stuffing,
    };
    notifyListeners();
  }
}
