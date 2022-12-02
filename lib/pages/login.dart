import 'package:bismillahfinalproject/models/api/loginapi.dart';
import 'package:bismillahfinalproject/pages/mainpage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHiddenPassword = true;
  
  @override
  Widget build(BuildContext context) {

    return initWidget();
  }

  Widget initWidget() {
    var login = Provider.of<LoginApi>(context);
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Container(
          height: 250,
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20),),
            color: Color(0xFF607EAA),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin:EdgeInsets.only(left: 20, right: 20, top: 70),
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xFFEAE3D2),
          ),
          alignment: Alignment.center,
           child: TextField(
            controller: _emailController,
            cursorColor: Color(0xFF607EAA),
            decoration: InputDecoration(
              icon: Icon(
                Icons.email,
                color: Color(0xFF607EAA),
              ),
              hintText: "Enter your Email",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            )
           ),
           ),
          Container(
          margin:EdgeInsets.only(left: 20, right: 20, top: 24),
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Color(0xFFEAE3D2),
          ),
          alignment: Alignment.center,
           child: TextField(
            controller: _passwordController,
             obscureText:
               _isHiddenPassword,
            cursorColor: Color(0xFF607EAA),
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock,
                color: Color(0xFF607EAA),
              ),
              hintText: "Enter your Password",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              suffixIcon: InkWell(
                 onTap:
                 _tootlePasswordView,
                 child: Icon(
                  color:Color(0xFF607EAA),
                  _isHiddenPassword? 
                   Icons.visibility_outlined : 
                   Icons.visibility_off_outlined))
              ),
            )
           ),
          Container(
          margin:EdgeInsets.only(left: 20, right: 20, top: 70),
          padding: EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.center,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xFF607EAA),
          ),
          child: TextButton (onPressed: (){
            login.postLogin(_emailController.text, _passwordController.text);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Berhasil Login"))
              );
              Navigator.of(context).pushNamed("/MainPage");
            }, 
          child: Text(
            "LOGIN",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          ),
          ),
          SizedBox(height: 10),
          RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Dont have an Account? ", 
               style: TextStyle(fontSize: 15, color: Colors.black),
          ), 
          TextSpan(
            text: "Register", 
          style: TextStyle(fontSize: 15, color: Color(0xFF607EAA), ),
          recognizer: TapGestureRecognizer()
          ..onTap =(){
            Navigator.of(context).pushNamed("/RegisterPage");
          }), 
            ],
           ),
          ),
      ],
    ))
    );
  }
    void _tootlePasswordView() {
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
    });
  }
}
