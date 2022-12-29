import 'dart:async';
import 'package:bismillahfinalproject/utils/navigator/navigator.dart';
import 'package:bismillahfinalproject/views/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  route() {
    Navigator.of(context).pushReplacement(
      NavigatorFadeTransitionHelper(
        child: const OnboardingScreen(),
      ),
    );
  }

  startTimer() {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1C3879),
      child: Image.asset("assets/logo.png"),
    );
  }
}
