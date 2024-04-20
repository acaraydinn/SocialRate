import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:socialrate/apps_constants.dart';
import 'package:socialrate/views/MainView/main_view.dart';
import '../HomeView/home_view.dart';
import 'login_view_model.dart';
import 'models/login_response.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _validatePhone = true;
  bool _validatePassword = true;
  final LoginViewModel _viewModel = LoginViewModel();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _checkValidation() {
    setState(() {
      if (emailController.text.isEmpty || emailController.text.length < 10) {
        _validatePhone = false;
      }
      if (passwordController.text.isEmpty) {
        _validatePassword = false;
      }
      if (passwordController.text.isNotEmpty) {
        _validatePassword = true;
      }
      if (emailController.text.isNotEmpty ||
          emailController.text.length >= 10) {
        _validatePhone = true;
      }
    });

    return _validatePassword && _validatePhone;
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateDownDirection],
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                logo,
                height: 170,
              ),
              spacer(height: 48),
              TextField(
                controller: emailController,
                cursorColor: SRColors.black,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    errorText:
                        _validatePhone ? "" : "Lütfen geçerli bir numara girin",
                    hintText: "ornek@mail.com",
                    isDense: true,
                    contentPadding: const EdgeInsets.fromLTRB(1, 1, 1, 8),
                    labelText: "Telefon numarası",
                    labelStyle: const TextStyle(color: SRColors.black),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: SRColors.black),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: SRColors.black),
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: SRColors.black),
                    ),
                    disabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: SRColors.black),
                    )),
              ),
              spacer(height: 16),
              TextField(
                controller: passwordController,
                cursorColor: SRColors.black,
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                decoration: InputDecoration(
                  errorText: _validatePassword ? "" : "Alan zorunludur",
                  hintText: "******",
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(1, 1, 1, 8),
                  labelText: "Parola",
                  labelStyle: const TextStyle(color: SRColors.black),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: SRColors.black),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: SRColors.black),
                  ),
                ),
              ),
              spacer(height: 16),
              makeButton(
                text: "Giriş",
                onPressed: () async {
                  if (_checkValidation()) {
                    LoginResponse? response = await _viewModel.loginRequest(
                        phoneNumber: emailController.text,
                        password: passwordController.text);
                    response != null ? Get.to(() => const MainView()) : null;
                  }
                },
              ),
              spacer(height: 8),
              makeButton(
                backgroundColor: Colors.white,
                text: "Kayıt ol",
                textcolor: SRColors.darkGray,
                onPressed: () {
                  Get.to(() => const HomeView());
                },
              ),
            ],
          ),
        ),
      ));
}
