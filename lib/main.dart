import 'package:bismillahfinalproject/models/api/loginapi.dart';
import 'package:bismillahfinalproject/pages/login.dart';
import 'package:bismillahfinalproject/pages/mainpage.dart';
import 'package:bismillahfinalproject/pages/register.dart';
import 'package:bismillahfinalproject/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:bismillahfinalproject/pages/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginApi(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => Splash(),
          '/WelcomePage': (context) => WelcomePage(),
          '/LoginPage': (context) => LoginPage(),
          '/RegisterPage': (context) => RegisterPage(),
          '/MainPage': (context) => MainPage(),
        },
      ),
    );
  }
}