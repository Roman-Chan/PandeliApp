import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pandeli_app/dtos/providers/token_provider.dart';
import 'package:pandeli_app/services/base_uri.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProviderSendEmail extends ChangeNotifier{
  Future<bool> sendEmail(email) async{
    final url = Uri.parse('$baseUrl/sendemail/token');
    final response = await http.post(url, body:{
      'email': email
    });

    if(response.statusCode == 200){
      return true;
    }
    else
    {
      return false;
    }
  }
}