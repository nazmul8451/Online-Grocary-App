class UserModel {
  String? status;
  String? message;
  UserData? data;
  String? timestamp;

  UserModel({this.status, this.message, this.data, this.timestamp});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class UserData {
  int? id;
  String? username;
  String? email;
  String? displayName;
  String? firstName;
  String? lastName;
  String? role;
  String? token;
  String? password;

  UserData(
      {this.id,
        this.username,
        this.email,
        this.displayName,
        this.firstName,
        this.lastName,
        this.role,
        this.token,
        this.password});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    displayName = json['display_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    role = json['role'];
    token = json['token'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['display_name'] = this.displayName;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['role'] = this.role;
    data['token'] = this.token;
    data['password'] = this.password;
    return data;
  }
}
