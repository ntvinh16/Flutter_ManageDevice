class UserResponse {
  String? sId;
  String? username;
  String? fullname;
  String? userId;
  String? officeId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserResponse(
      {this.sId,
      this.username,
      this.fullname,
      this.userId,
      this.officeId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  UserResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    fullname = json['fullname'];
    userId = json['userId'];
    officeId = json['officeId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['fullname'] = this.fullname;
    data['userId'] = this.userId;
    data['officeId'] = this.officeId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }

  static List<UserResponse> convertToUserResponseList(List<dynamic> dataList) {
  return dataList.map((json) => UserResponse.fromJson(json)).toList();
}
}