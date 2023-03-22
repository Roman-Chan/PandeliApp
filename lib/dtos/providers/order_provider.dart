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

  String _designName = '';
  String get getDesignName => _designName;
  set designName(String designName) {
    _designName = designName;
    notifyListeners();
  }

  String _imgURL =
      'https://cdn.pixabay.com/photo/2022/10/04/14/27/cat-7498364_960_720.jpg';
  String get getImgURL => _imgURL;
  set imgURL(String imgURL) {
    _imgURL = imgURL;
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

  clearOptions() {
    _design = '';
    _flavor = '';
    _size = '';
    _stuffing = '';
    _order = {};
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
