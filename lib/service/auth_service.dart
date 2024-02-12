import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:project/model/login_model.dart';

class AuthService {
  String urlLogin = "http://jurnal.live/login";
  String urlSignUp = "http://jurnal.live/register";

  LoginModel loginModel = LoginModel(user: User());

  Future<LoginModel> loginService(dynamic data) async {
    try {
      http.Response response = await http.post(
        Uri.parse(urlLogin),
        body: data,
      ); 
      if (response.statusCode == 200) {
        loginModel = await compute(_pareJsonLogin, response.body);
      }
      return loginModel;
    } catch (err) {
      throw Exception(err);
    }
  }
  
}

LoginModel _pareJsonLogin(String json) => LoginModel.fromJson(jsonDecode(json));
