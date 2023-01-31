import 'package:employer_app/app/modules/all_chats/models/chat_model.dart';
import 'package:employer_app/app/modules/all_chats/models/employe_model.dart';

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
