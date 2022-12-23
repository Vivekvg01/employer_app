class OtpModel {
  OtpModel({
    this.id,
    this.name,
    this.email,
    this.emailVerified,
    this.userType,
    this.employerData,
    this.token,
  });

  String? id;
  String? name;
  String? email;
  bool? emailVerified;
  String? userType;
  String? employerData;
  String? token;

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        emailVerified: json["emailVerified"],
        userType: json["userType"],
        employerData: json["employerData"],
        token: json["token"],
      );
}
