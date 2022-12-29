import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C3879),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/logo.png", height: 400, width: 400),
            Text(
              "Explore the best\nProduct for your want",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              )),
            ),
          ],
        ),
      )),
    );
  }
}
