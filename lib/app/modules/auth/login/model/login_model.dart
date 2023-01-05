class LoginModel {
  LoginModel({
    this.id,
    this.name,
    this.email,
    this.userType,
    this.employerData,
    this.token,
    this.isBlocked,
  });

  String? id;
  String? name;
  String? email;
  String? userType;
  String? employerData;
  String? token;
  bool? isBlocked;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        userType: json["userType"] ?? "",
        employerData: json["employerData"] ?? "",
        isBlocked: json["isBlocked"] ?? '',
        token: json["token"],
      );
}
