class MyChatModel {
  MyChatModel({
    this.id,
    this.employer,
    this.employee,
    this.roomId,
    this.chats,
    this.employeeViewed,
    this.employerViewed,
    this.v,
  });

  String? id;
  Employe? employer;
  Employe? employee;
  String? roomId;
  List<Chat>? chats;
  bool? employeeViewed;
  bool? employerViewed;
  int? v;

  factory MyChatModel.fromJson(Map<String, dynamic> json) => MyChatModel(
        id: json["_id"],
        employer: Employe.fromJson(json["employer"]),
        employee: Employe.fromJson(json["employee"]),
        roomId: json["roomId"],
        chats: List<Chat>.from(json["chats"].map((x) => Chat.fromJson(x))),
        employeeViewed: json["employeeViewed"],
        employerViewed: json["employerViewed"],
        v: json["__v"],
      );
}

class Chat {
  Chat({
    this.message,
    this.user,
  });

  String? message;
  String? user;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        message: json["message"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user,
      };
}

class Employe {
  Employe({
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
    this.employerData,
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
  String? employerData;

  factory Employe.fromJson(Map<String, dynamic> json) => Employe(
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
        employerData: json["employerData"],
      );
}
