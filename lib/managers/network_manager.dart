import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:socialrate/apps_constants.dart';
import 'package:socialrate/managers/alert_manager.dart';
import 'package:socialrate/views/LoginView/login_view.dart';
import 'package:socialrate/views/LoginView/login_view_model.dart';

class NetworkManager {
  final String _baseUrl = "https://socialrate.net/api";
  final String _loginUrl = "https://socialrate.net/api/accounts/login/";
  final AlertController _alertController = AlertController();
  final String _accessToken = "Bearer ${box.read(TokenType.access.toString())}";

  Future<http.Response> get(String endpoint) async {
    _alertController.showLoader();
    final response = await http.get(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': _accessToken
      },
    );
    print(_accessToken);
    return _handleResponse(response);
  }

  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    _alertController.showLoader();
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': _accessToken
      },
    );

    return _handleResponse(response);
  }

  Future<http.Response> put(String endpoint, Map<String, dynamic> body) async {
    _alertController.showLoader();
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': _accessToken
      },
    );

    return _handleResponse(response);
  }

  http.Response _handleResponse(http.Response response) {
    void toLogin() {
      Get.offAll(const LoginView());
    }

    _alertController.dismissLoader();
    if (response.statusCode == 401 &&
        response.request?.url.toString() != _loginUrl) {
      box.remove(TokenType.access.toString());
      const String errorMessage =
          'Oturumunuzun süresi dolmuştur. Lütfen tekrar giriş yapın.';
      _alertController.show(body: errorMessage, action: toLogin);
      return response;
    } else if (response.statusCode != 200) {
      String errorMessage = "Beklenmeyen bir hata oluştu. \n ${response.body}";
      _alertController.show(body: errorMessage);
      return response;
    } else {
      return response;
    }
  }
}
