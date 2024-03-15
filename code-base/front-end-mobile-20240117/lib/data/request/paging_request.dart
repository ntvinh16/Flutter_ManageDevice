// To parse this JSON data, do
//
//     final pagingRequest = pagingRequestFromJson(jsonString);

import 'dart:convert';

PagingRequest pagingRequestFromJson(String str) => PagingRequest.fromJson(json.decode(str));

String pagingRequestToJson(PagingRequest data) => json.encode(data.toJson());

class PagingRequest {
  PagingRequest({
    this.pageSize,
    this.page,
  });

  int? pageSize;
  int? page;

  factory PagingRequest.fromJson(Map<String, dynamic> json) => PagingRequest(
    pageSize: json["pageSize"],
    page: json["page"],
  );

  Map<String, dynamic> toJson() => {
    "pageSize": pageSize,
    "page": page,
  };
}
