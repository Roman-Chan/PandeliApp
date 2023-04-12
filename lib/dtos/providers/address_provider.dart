import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:pandeli_app/dtos/providers/token_provider.dart';
import 'package:pandeli_app/dtos/response/address_response_dto.dart';
import 'package:pandeli_app/services/base_uri.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressProvider extends ChangeNotifier {
  final logger = Logger();

  Future getToken() async {
    final prefs = await SharedPreferences.getInstance();

    final tokenProvider = TokenProvider(prefs).getToken();
    return tokenProvider;
  }

  List<AddressResponseDto>? _address;
  bool isLoading = true;
  List<AddressResponseDto>? get address => _address;

  Future fetchAddress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final id = TokenProvider(prefs).getid();

      final token = await getToken();
      final response = await http.get(
        Uri.parse('$baseUrl/api/addresses/$id'),
        headers: {
          'Authorization': '$token',
        },
      );
      logger.d(id);
      logger.d(Uri.parse('$baseUrl/api/addresses/$id'));

      logger.d(response.body);

      if (response.statusCode == 200) {
        final List<dynamic> json = jsonDecode(response.body)[0];
        _address = json
            .map(
              (address) => AddressResponseDto.fromMap({
                'index': json.indexOf(address),
                'address': address,
              }),
            )
            .toList();
        isLoading = false;
        /*  isError = false; */
        logger.d(_address);
        notifyListeners();
      } else {
        _address = [];
        isLoading = false;
        notifyListeners();
      }

      logger.d(isLoading);
    } catch (e) {
      logger.d(e);
      isLoading = false;
      _address = [];
      notifyListeners();
    }
  }

  /*METODO POST  */
  Future createAddres(String address, BuildContext context) async {
    ///final addres = CreateAddressRequestDto(address: address);
    final prefs = await SharedPreferences.getInstance();
    final id = TokenProvider(prefs).getid();
    final url = Uri.parse('$baseUrl/api/address');
    final responses = await http.post(
      url,
      body: {'id': id, 'address': address},
    );

    if (responses.statusCode == 200) {
      logger.d('address created: ${responses.body}');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Direccion Añadida!')),
        );
        fetchAddress();
        Navigator.pop(context);
      }
    } else {
      /* logger.d(Uri.parse('$baseUrl/api/address/$id')); */
      logger.e('Error: ${responses.statusCode}');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${responses.statusCode}!')),
        );
      }
    }
  }

  Future deleteAddress(int index) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final id = TokenProvider(prefs).getid();
      final token = await getToken();
      final response = await http.delete(
        Uri.parse('$baseUrl/api/address/$id/$index'),
        headers: {
          'Authorization': '$token',
        },
      );
      if (response.statusCode == 200) {
        _address?.removeAt(index);
        notifyListeners();
        if (isLoading) {
          isLoading = false;
        }
        if (_address!.isEmpty) {
          notifyListeners();
        }
      } else {
        logger.e('Error deleting address: ${response.body}');
      }
    } catch (e) {
      logger.e('Error deleting address: $e');
    }
  }

}
