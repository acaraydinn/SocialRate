// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    String? detail;
    String? refresh;
    String? access;

    LoginResponse({
        this.detail,
        this.refresh,
        this.access,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        detail: json["detail"],
        refresh: json["refresh"],
        access: json["access"],
    );

    Map<String, dynamic> toJson() => {
        "detail": detail,
        "refresh": refresh,
        "access": access,
    };
}
