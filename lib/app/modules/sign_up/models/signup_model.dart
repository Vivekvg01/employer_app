import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  String name;
  String email;
  String password;
  String userType;

  SignUpModel({
    required this.name,
    required this.email,
    required this.password,
    required this.userType,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      userType: json['userType'],
    );
  }
  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "userType": userType,
      };
}
