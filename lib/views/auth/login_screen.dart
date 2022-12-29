import 'package:bismillahfinalproject/utils/navigator/navigator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../view_models/login_view_model.dart';
import '../../widgets/botnavbar.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<LoginViewModel>(
          builder: (context, login, _) => Column(
            children: [
              Container(
                height: 250,
                width: 400,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Color(0xFF607EAA),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Login',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 24),
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xFFEAE3D2),
                ),
                alignment: Alignment.center,
                child: TextField(
                  controller: login.emailController,
                  onChanged: (value) => login.emailController.text,
                  cursorColor: const Color(0xFF607EAA),
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Color(0xFF607EAA),
                    ),
                    hintText: "Enter your Email",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFFEAE3D2),
                ),
                alignment: Alignment.center,
                child: TextField(
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16),
                    FilteringTextInputFormatter.allow(
                      RegExp("[a-zA-Z0-9 ]"),
                    ),
                  ],
                  obscureText: login.obscureText,
                  controller: login.passwordController,
                  onChanged: (value) => login.passwordController.text,
                  cursorColor: const Color(0xFF607EAA),
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.lock,
                      color: Color(0xFF607EAA),
                    ),
                    hintText: "Enter your Password",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: () {
                        login.changeVisibleText(!login.obscureText);
                      },
                      icon: Icon(
                        color: const Color(0xFF607EAA),
                        login.obscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.maxFinite,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color(0xFF607EAA),
                        ),
                      ),
                      onPressed: () async {
                        try {
                          await login.postLogin().then(
                                (value) => Fluttertoast.showToast(
                                        msg: 'Berhasil Login')
                                    .then(
                                  (_) =>
                                      Navigator.of(context).pushAndRemoveUntil(
                                          NavigatorFadeTransitionHelper(
                                            child: const BotNavBar(),
                                          ),
                                          (route) => false),
                                ),
                              );
                        } catch (e) {
                          Fluttertoast.showToast(msg: e.toString());
                        }
                      },
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Dont have an Account? ",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    TextSpan(
                      text: "Register",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF607EAA),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                            NavigatorFadeTransitionHelper(
                              child: const RegisterScreen(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
