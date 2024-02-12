import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:project/model/login_model.dart';
import 'package:project/model/user_model.dart';
import 'package:project/model/SalesModel.dart';

class RestAPIService {
  Future<bool> addUserService(String email, String username) async {
    try {
      final Map<String, dynamic> map = {
        "username": username,
        "email": email
      };
      http.Response response = await http.post(Uri.parse("http://jurnal.live/register"), body: map);
      debugPrint("Response body: ${response.body}");
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      throw Exception(err);
    }
  }

  UserModel _userModel = UserModel();
  SalesModel _salesModel = SalesModel();

  Future<SalesModel> readSalesReport() async {
    try {
      http.Response response = await http.get(Uri.parse("http://jurnal.live/testapi/purchasing"));
      if (response.statusCode == 200) {
        // print(response.body);
        _salesModel = await compute(_salesJson, response.body); 
        print(_salesModel.data);
      }
    } catch (err) {
      debugPrint("Error: $err");
      throw Exception(err);
    }
    return _salesModel;
  } 
}

UserModel _pareJson(String json) => UserModel.fromJson(jsonDecode(json));
SalesModel _salesJson(String json) => SalesModel.fromJson(jsonDecode(json)); 