import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../../widgets/botnavbar.dart';
import '../../widgets/button_widget.dart';

class SuccessCheckoutScreen extends StatelessWidget {
  const SuccessCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  color: const Color(0xff607EAA),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 35),
              ),
              const SizedBox(height: 36),
              const Text(
                "Payment Successful!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 45),
              ButtonWidget(
                  buttonText: "BACK TO HOME",
                  height: 45,
                  width: width,
                  onpressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        NavigatorFadeTransitionHelper(child: const BotNavBar()),
                        (route) => false);
                  },
                  radius: 10,
                  color: const Color(0xff607EAA),
                  fontSize: 16)
            ],
          ),
        ),
      ),
    );
  }
}
