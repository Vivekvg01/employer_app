class Owner {
  Owner({
    this.id,
    this.name,
    this.email,
    this.password,
    this.userType,
    this.emailVerified,
    this.isBlocked,
    this.reported,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.employeeData,
  });

  String? id;
  String? name;
  String? email;
  String? password;
  String? userType;
  bool? emailVerified;
  bool? isBlocked;
  int? reported;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? employeeData;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        userType: json["userType"],
        emailVerified: json["emailVerified"],
        isBlocked: json["isBlocked"],
        reported: json["reported"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        employeeData: json["employeeData"],
      );
}
