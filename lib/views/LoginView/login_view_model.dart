import 'package:flutter/foundation.dart';
import 'package:socialrate/apps_constants.dart';
import 'package:socialrate/managers/network_manager.dart';

import 'models/login_response.dart';

class LoginViewModel {
  final NetworkManager _netwokrManager = NetworkManager();
  LoginResponse loginResponse = LoginResponse();

  Future<LoginResponse?> loginRequest(
      {required String phoneNumber, required String password}) async {
    Map<String, dynamic> body = {
      "phone_number": phoneNumber,
      "password": password
    };

    var response = await _netwokrManager.post("accounts/login/", body);
    loginResponse = loginResponseFromJson(response.body);
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      box.write(TokenType.access.toString(), loginResponse.access);
      box.write(TokenType.refresh.toString(), loginResponse.refresh);
      return loginResponse;
    }
    return null;
  }
}

enum TokenType { access, refresh }
