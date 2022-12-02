import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

class LoginApi with ChangeNotifier {
  Future<dynamic> postLogin(String email, String password) async {
    Uri url = Uri.parse('https://api1.sib3.nurulfikri.com/api/login');

    try {
      var response = await http.post(
        url,
        body: ({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        print(json.decode(response.body));
      }else{
        print(json.decode(response.body));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

class RegisterApi with ChangeNotifier {
  Future<dynamic> postLogin(String email, String password) async {
    Uri url = Uri.parse('https://api1.sib3.nurulfikri.com/api/login');

    try {
      var response = await http.post(
        url,
        body: ({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        print(json.decode(response.body));
      }else{
        print(json.decode(response.body));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}





