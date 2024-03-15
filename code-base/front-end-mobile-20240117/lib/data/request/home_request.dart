// To parse this JSON data, do
//
//     final homeRequest = homeRequestFromJson(jsonString);

import 'dart:convert';

HomeRequest homeRequestFromJson(String str) => HomeRequest.fromJson(json.decode(str));

String homeRequestToJson(HomeRequest data) => json.encode(data.toJson());

class HomeRequest {
  HomeRequest();

  factory HomeRequest.fromJson(Map<String, dynamic> json) => HomeRequest(
  );

  Map<String, dynamic> toJson() => {
  };
}
