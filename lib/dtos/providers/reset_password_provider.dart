import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pandeli_app/services/base_uri.dart';
import 'package:http/http.dart' as http;

class ProviderSendEmail extends ChangeNotifier{
  Future<bool> sendEmail(email) async{
    final url = Uri.parse('$baseUrl/api/sendemail/token');
    final response = await http.post(url, body:{
      'email': email
    });
    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){
      print(response.body);
      return true;
    }
    else
    {
      final errorMessage = json.decode(response.body)['message'];
        throw Exception(errorMessage);
    }
  }
}