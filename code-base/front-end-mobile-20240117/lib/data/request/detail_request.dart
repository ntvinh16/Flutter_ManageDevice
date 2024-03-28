// To parse this JSON data, do
//
//     final homeRequest = homeRequestFromJson(jsonString);

import 'dart:convert';

DetailRequest detailRequestFromJson(String str) => DetailRequest.fromJson(json.decode(str));

String detailRequestToJson(DetailRequest data) => json.encode(data.toJson());

class DetailRequest {
  DetailRequest();

  factory DetailRequest.fromJson(Map<String, dynamic> json) => DetailRequest(
  );

  Map<String, dynamic> toJson() => {
  };
}
