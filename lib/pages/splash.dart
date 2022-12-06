import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
   void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }

  route(){
    Navigator.of(context).pushReplacementNamed('/WelcomePage');
  }

  startTimer(){
    var duration = Duration(seconds: 3);
    return Timer(duration, route);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1C3879),
      child: Container(
        child: Image.asset("assets/logo.png"),
      ),

    );
  }
}