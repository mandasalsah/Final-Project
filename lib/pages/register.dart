import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
    bool _isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
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
                    'Register',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin:EdgeInsets.only(left: 20, right: 20, top: 40),
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xFFEAE3D2),
          ),
          alignment: Alignment.center,
           child: TextField(
            cursorColor: Color(0xFF607EAA),
            decoration: InputDecoration(
              icon: Icon(
                Icons.business_center,
                color: Color(0xFF607EAA),
              ),
              hintText: "Enter your Full Name",
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
            borderRadius: BorderRadius.circular(50),
            color: Color(0xFFEAE3D2),
          ),
          alignment: Alignment.center,
           child: TextField(
            cursorColor: Color(0xFF607EAA),
            decoration: InputDecoration(
              icon: Icon(
                Icons.person,
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
          margin:EdgeInsets.only(left: 20, right: 20, top: 24),
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xFFEAE3D2),
          ),
          alignment: Alignment.center,
           child: TextField(
            cursorColor: Color(0xFF607EAA),
            decoration: InputDecoration(
              icon: Icon(
                Icons.phone_android,
                color: Color(0xFF607EAA),
              ),
              hintText: "Enter your Handpone",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            )
           ),
           ),
          Container(
          margin:EdgeInsets.only(left: 20, right: 20, top: 35),
          padding: EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.center,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xFF607EAA),
          ),
          child: TextButton (onPressed: (){
              Navigator.of(context).pushNamed("/MainPage");
            }, 
          child: Text(
            "REGISTER",
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
                text: "Do You have an Account? ", 
               style: TextStyle(fontSize: 15, color: Colors.black),
          ), 
          TextSpan(
            text: "Login", 
          style: TextStyle(fontSize: 15, color: Color(0xFF607EAA),),
          recognizer: TapGestureRecognizer()
          ..onTap =(){
            Navigator.of(context).pushNamed("/LoginPage");
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