import 'package:bismillahfinalproject/utils/navigator/navigator.dart';
import 'package:flutter/material.dart';

import '../auth/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF1C3879),
                  Color(0xFF607EAA),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Stack(
            children: [
              Positioned(
                bottom: 450,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      width: 130,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'WELCOME',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 200,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        NavigatorFadeTransitionHelper(
                          child: const LoginScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEAE3D2),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Center(
                        child: Text(
                          'GET STARTED',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
