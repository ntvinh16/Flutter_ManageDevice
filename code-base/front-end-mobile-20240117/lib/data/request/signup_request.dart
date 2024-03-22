// To parse this JSON data, do
//
//     final homeRequest = homeRequestFromJson(jsonString);

import 'dart:convert';

SignUpRequest signUpRequestFromJson(String str) =>
    SignUpRequest.fromJson(json.decode(str));

String signUpRequestToJson(SignUpRequest data) => json.encode(data.toJson());

class SignUpRequest {
  final String? username;
  final String? password;
  final String? confirmPassword;
  SignUpRequest({this.username, this.password, this.confirmPassword});

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => SignUpRequest();

  Map<String, dynamic> toJson() => {};
}
