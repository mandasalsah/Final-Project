import 'package:bismillahfinalproject/views/onboarding/intro_page1.dart';
import 'package:bismillahfinalproject/views/onboarding/intro_page2.dart';
import 'package:bismillahfinalproject/views/onboarding/intro_page3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/navigator/navigator_fade_transition.dart';
import 'welcome_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();

  bool OnlastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              OnlastPage = (index == 2);
            });
          },
          children: [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),
        Container(
          alignment: Alignment(0, 0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  _controller.jumpToPage(2);
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              SmoothPageIndicator(controller: _controller, count: 3),
              OnlastPage
                  ? GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          NavigatorFadeTransitionHelper(
                            child: const WelcomeScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ))
                  : GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: Text(
                        'next',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ))
            ],
          ),
        ),
      ],
    ));
  }
}
