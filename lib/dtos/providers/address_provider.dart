import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:pandeli_app/dtos/providers/token_provider.dart';
import 'package:pandeli_app/dtos/response/address_response_dto.dart';
import 'package:pandeli_app/services/base_uri.dart';
import 'package:shared_preferences/shared_preferences.dart';
/* import 'package:pandeli_app/dtos/response/create_address_response.dart'; */

class AddressProvider extends ChangeNotifier {
  final logger = Logger();

  /*  bool isError = false; */

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
        final List<dynamic> json = jsonDecode(response.body);
        _address = json
            .map(
              (list) => AddressResponseDto(addresses: List<String>.from(list)),
            )
            .toList();
        isLoading = false;
        /*  isError = false; */
        notifyListeners();
      }
    } catch (e) {
      logger.d(e);
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
    
}
