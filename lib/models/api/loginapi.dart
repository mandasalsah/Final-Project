import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

class LoginApi with ChangeNotifier {
  Future<dynamic> postLogin(String email, String password) async {
    Uri url = Uri.parse('https://api1.sib3.nurulfikri.com/api/login');

      var response = await http.post(
        url,
        body: ({
          'email': email,
          'password': password,
        }),
      );
      print(json.decode(response.body));

      if (response.statusCode == 200) {
        print(json.decode(response.body));
      }else{
        print(json.decode(response.body));
      }
    // try {
    // } catch (e) {
    //   print(e.toString());
    // }
  }
}

class RegisterApi with ChangeNotifier {
   Future<dynamic> signup(String name, String email, String handphone,
      String password, String passwordConfirm) async {
    var url = Uri.parse("https://api1.sib3.nurulfikri.com/api/register");
    var response = await http.post(
      url,
      body: ({
        "name": name,
        "email": email,
        "handphone": handphone,
        "password": password,
        "password_confirmation": passwordConfirm
      }),
    );
    if (response.statusCode == 200) {}
    return throw json.decode(response.body)['info'];
  }
}





