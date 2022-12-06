import 'package:bismillahfinalproject/models/api/loginapi.dart';
import 'package:bismillahfinalproject/pages/HomePage.dart';
import 'package:bismillahfinalproject/widgets/HomeBottomBar.dart';
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
  @override
  Widget build(BuildContext context) {
    bool _isHiddenPassword = true;
    final login = Provider.of<LoginApi>(context);
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Container(
                height: 250,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
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
              TextFormField(
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
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(left: 20, right: 20, top: 70),
              //   padding: EdgeInsets.only(left: 20, right: 20),
              //   height: 60,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(50),
              //     color: Color(0xFFEAE3D2),
              //   ),
              //   alignment: Alignment.center,
              //   child: Text("data"),
              // ),
              // TextFormField(),
              TextFormField(
                controller: _passwordController,
                obscureText: _isHiddenPassword,
                cursorColor: Color(0xFF607EAA),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Color(0xFF607EAA),
                  ),
                  hintText: "Enter your Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(
                        () {
                          if (_isHiddenPassword) {
                            _isHiddenPassword = false;
                          } else {
                            _isHiddenPassword = true;
                          }
                        },
                      );
                    },
                    icon: Icon(
                      color: Color(0xFF607EAA),
                      Icons.visibility_outlined,

                      // _isHiddenPassword
                      //     ? Icons.visibility_outlined
                      //     : Icons.visibility_off_outlined
                    ),
                  ),
                  // InkWell(

                  //     onTap:
                  //setState(() {
                  //             if (_obscure) {
                  //               _obscure = false;
                  //             } else {
                  //               _obscure = true;
                  //             }
                  //           });,
                  //     child:
                  //     Icon(
                  //         color: Color(0xFF607EAA),
                  //         _isHiddenPassword
                  //             ? Icons.visibility_outlined
                  //             : Icons.visibility_off_outlined)),
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(left: 20, right: 20, top: 24),
              //   padding: EdgeInsets.only(left: 20, right: 20),
              //   height: 60,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(100),
              //     color: Color(0xFFEAE3D2),
              //   ),
              //   alignment: Alignment.center,
              //   child: Text("data"),
              // ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFF607EAA),
                ),
                child: TextButton(
                  onPressed: () async {
                    var formLogin = login.postLogin(
                        _emailController.text, _passwordController.text);
                    try {
                      await formLogin.then((value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeBottomBar(),
                          )));

                      // if(infoAPi == "Email atau Password yang dimasukkan salah")
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text("username dan password benar"),
                      //     action: SnackBarAction(label: "next", onPressed: () {
                      //        Navigator.of(context).pushNamed("/MainPage");
                      //     }),
                      //   ),
                      // ),
                      // Fluttertoast.showToast(msg: 'berhasil login')
                      //     .then((value) =>
                      //         Navigator.of(context).pushReplacement(
                      //           MaterialPageRoute(
                      //               builder: (context) =>
                      //                   const BottomNav()),
                      //         )));
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Email atau Password salah",
                        ),
                        action: SnackBarAction(label: "undo", onPressed: () {}),
                      ));
                      // Fluttertoast.showToast(msg: e.toString());
                    }

                    // ScaffoldMessenger.of(context)
                    //     .showSnackBar(SnackBar(content: Text("Berhasil Login")));
                    // Navigator.of(context).pushNamed("/MainPage");
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
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF607EAA),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushNamed("/RegisterPage");
                          }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }

  // Widget initWidget() {
  //   bool _isHiddenPassword = true;
  //   final login = Provider.of<LoginApi>(context);
  //   TextEditingController _emailController = TextEditingController();
  //   TextEditingController _passwordController = TextEditingController();
  //   return Scaffold(
  //     body: SingleChildScrollView(
  //       child: Form(
  //         child: Column(
  //           children: [
  //             Container(
  //               height: 250,
  //               width: 400,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.all(
  //                   Radius.circular(20),
  //                 ),
  //                 color: Color(0xFF607EAA),
  //               ),
  //               child: Center(
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     Container(
  //                       child: Text(
  //                         'Login',
  //                         style: TextStyle(fontSize: 20, color: Colors.white),
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             TextFormField(
  //               controller: _emailController,
  //               cursorColor: Color(0xFF607EAA),
  //               decoration: InputDecoration(
  //                 icon: Icon(
  //                   Icons.email,
  //                   color: Color(0xFF607EAA),
  //                 ),
  //                 hintText: "Enter your Email",
  //                 enabledBorder: InputBorder.none,
  //                 focusedBorder: InputBorder.none,
  //               ),
  //             ),
  //             // Container(
  //             //   margin: EdgeInsets.only(left: 20, right: 20, top: 70),
  //             //   padding: EdgeInsets.only(left: 20, right: 20),
  //             //   height: 60,
  //             //   decoration: BoxDecoration(
  //             //     borderRadius: BorderRadius.circular(50),
  //             //     color: Color(0xFFEAE3D2),
  //             //   ),
  //             //   alignment: Alignment.center,
  //             //   child: Text("data"),
  //             // ),
  //             // TextFormField(),
  //             TextFormField(
  //               controller: _passwordController,
  //               obscureText: _isHiddenPassword,
  //               cursorColor: Color(0xFF607EAA),
  //               decoration: InputDecoration(
  //                 icon: Icon(
  //                   Icons.lock,
  //                   color: Color(0xFF607EAA),
  //                 ),
  //                 hintText: "Enter your Password",
  //                 enabledBorder: InputBorder.none,
  //                 focusedBorder: InputBorder.none,
  //                 suffixIcon: IconButton(
  //                   onPressed: () {
  //                     setState(
  //                       () {
  //                         if (_isHiddenPassword) {
  //                           _isHiddenPassword = false;
  //                         } else {
  //                           _isHiddenPassword = true;
  //                         }
  //                       },
  //                     );
  //                   },
  //                   icon: Icon(
  //                     color: Color(0xFF607EAA),
  //                     Icons.visibility_outlined,

  //                     // _isHiddenPassword
  //                     //     ? Icons.visibility_outlined
  //                     //     : Icons.visibility_off_outlined
  //                   ),
  //                 ),
  //                 // InkWell(

  //                 //     onTap:
  //                 //setState(() {
  //                 //             if (_obscure) {
  //                 //               _obscure = false;
  //                 //             } else {
  //                 //               _obscure = true;
  //                 //             }
  //                 //           });,
  //                 //     child:
  //                 //     Icon(
  //                 //         color: Color(0xFF607EAA),
  //                 //         _isHiddenPassword
  //                 //             ? Icons.visibility_outlined
  //                 //             : Icons.visibility_off_outlined)),
  //               ),
  //             ),
  //             // Container(
  //             //   margin: EdgeInsets.only(left: 20, right: 20, top: 24),
  //             //   padding: EdgeInsets.only(left: 20, right: 20),
  //             //   height: 60,
  //             //   decoration: BoxDecoration(
  //             //     borderRadius: BorderRadius.circular(100),
  //             //     color: Color(0xFFEAE3D2),
  //             //   ),
  //             //   alignment: Alignment.center,
  //             //   child: Text("data"),
  //             // ),
  //             Container(
  //               margin: EdgeInsets.only(left: 20, right: 20, top: 70),
  //               padding: EdgeInsets.only(left: 20, right: 20),
  //               alignment: Alignment.center,
  //               height: 60,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(50),
  //                 color: Color(0xFF607EAA),
  //               ),
  //               child: TextButton(
  //                 onPressed: () async {
  //                   var formLogin = login.postLogin(
  //                       _emailController.text, _passwordController.text);
  //                   try {
  //                     await formLogin.then((value) => Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                           builder: (context) => const HomeBottomBar(),
  //                         )));

  //                     // if(infoAPi == "Email atau Password yang dimasukkan salah")
  //                     // ScaffoldMessenger.of(context).showSnackBar(
  //                     //   SnackBar(
  //                     //     content: Text("username dan password benar"),
  //                     //     action: SnackBarAction(label: "next", onPressed: () {
  //                     //        Navigator.of(context).pushNamed("/MainPage");
  //                     //     }),
  //                     //   ),
  //                     // ),
  //                     // Fluttertoast.showToast(msg: 'berhasil login')
  //                     //     .then((value) =>
  //                     //         Navigator.of(context).pushReplacement(
  //                     //           MaterialPageRoute(
  //                     //               builder: (context) =>
  //                     //                   const BottomNav()),
  //                     //         )));
  //                   } catch (e) {
  //                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //                       content: Text(
  //                         "Email atau Password salah",
  //                       ),
  //                       action: SnackBarAction(label: "undo", onPressed: () {}),
  //                     ));
  //                     // Fluttertoast.showToast(msg: e.toString());
  //                   }

  //                   // ScaffoldMessenger.of(context)
  //                   //     .showSnackBar(SnackBar(content: Text("Berhasil Login")));
  //                   // Navigator.of(context).pushNamed("/MainPage");
  //                 },
  //                 child: Text(
  //                   "LOGIN",
  //                   style: TextStyle(
  //                     color: Colors.white,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             SizedBox(height: 10),
  //             RichText(
  //               text: TextSpan(
  //                 children: [
  //                   TextSpan(
  //                     text: "Dont have an Account? ",
  //                     style: TextStyle(fontSize: 15, color: Colors.black),
  //                   ),
  //                   TextSpan(
  //                       text: "Register",
  //                       style: TextStyle(
  //                         fontSize: 15,
  //                         color: Color(0xFF607EAA),
  //                       ),
  //                       recognizer: TapGestureRecognizer()
  //                         ..onTap = () {
  //                           Navigator.of(context).pushNamed("/RegisterPage");
  //                         }),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
