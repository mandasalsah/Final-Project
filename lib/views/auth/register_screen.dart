import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';
import '../../view_models/register_view_model.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<RegisterViewModel>(
          builder: (context, register, _) => Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 250,
                width: 400,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Color(0xFF607EAA),
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFFEAE3D2),
                ),
                alignment: Alignment.center,
                child: TextField(
                  controller: register.usernameController,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(32),
                    FilteringTextInputFormatter.allow(
                      RegExp("[a-zA-Z0-9 ]"),
                    ),
                  ],
                  cursorColor: const Color(0xFF607EAA),
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.business_center,
                      color: Color(0xFF607EAA),
                    ),
                    hintText: "Enter your Full Name",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 24),
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFFEAE3D2),
                ),
                alignment: Alignment.center,
                child: TextField(
                  controller: register.emailController,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp("[a-zA-Z0-9@. ]"),
                    ),
                  ],
                  cursorColor: const Color(0xFF607EAA),
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.email_outlined,
                      color: Color(0xFF607EAA),
                    ),
                    hintText: "Enter your Email",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
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
                  controller: register.passwordController,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16),
                    FilteringTextInputFormatter.allow(
                      RegExp("[a-zA-Z0-9 ]"),
                    ),
                  ],
                  obscureText: register.obscureText,
                  cursorColor: const Color(0xFF607EAA),
                  decoration: InputDecoration(
                      icon: const Icon(
                        Icons.lock,
                        color: Color(0xFF607EAA),
                      ),
                      hintText: "Enter your Password",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      suffixIcon: InkWell(
                          onTap: () {
                            register.changeVisibleText(!register.obscureText);
                          },
                          child: Icon(
                              color: const Color(0xFF607EAA),
                              register.obscureText
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined))),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 24),
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFFEAE3D2),
                ),
                alignment: Alignment.center,
                child: TextField(
                  controller: register.phoneController,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(14),
                    FilteringTextInputFormatter.allow(
                      RegExp("[0-9]"),
                    ),
                  ],
                  cursorColor: const Color(0xFF607EAA),
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.phone_android,
                      color: Color(0xFF607EAA),
                    ),
                    hintText: "Enter your Handpone",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 32),
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
                        if (register.usernameController.text.length < 6) {
                          Fluttertoast.showToast(
                              msg: 'Username min 8 karakter');
                        } else if (register.passwordController.text.length <
                            8) {
                          Fluttertoast.showToast(
                              msg: 'Password min 8 karakter');
                        } else if (register.phoneController.text.length < 10) {
                          Fluttertoast.showToast(msg: 'Use valid phone number');
                        } else if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(register.emailController.text)) {
                          Fluttertoast.showToast(msg: 'Use valid email');
                        } else {
                          try {
                            await register
                                .postRegister()
                                .then((_) => Fluttertoast.showToast(
                                    msg: "Berhasil membuat akun"))
                                .then(
                                  (_) => Navigator.of(context).pushReplacement(
                                    NavigatorFadeTransitionHelper(
                                      child: const LoginScreen(),
                                    ),
                                  ),
                                );
                          } catch (e) {
                            Fluttertoast.showToast(
                              msg: e.toString(),
                            );
                          }
                        }
                      },
                      child: const Text(
                        "REGISTER",
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
                      text: "Do You have an Account? ",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    TextSpan(
                      text: "Login",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF607EAA),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                            NavigatorFadeTransitionHelper(
                              child: const LoginScreen(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
