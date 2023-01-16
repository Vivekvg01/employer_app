import 'my_profile_owner_model.dart';

class MyProfileModel {
  MyProfileModel({
    this.id,
    this.owner,
    this.totalSpend,
    this.balance,
    this.contractsPosted,
    this.activeJobs,
    this.completedJobs,
    this.notification,
    this.hires,
    this.reported,
    this.isBlocked,
    this.savedTalents,
    this.v,
  });

  String? id;
  Owner? owner;
  int? totalSpend;
  int? balance;
  List<String?>? contractsPosted;
  List<dynamic>? activeJobs;
  List<dynamic>? completedJobs;
  List<dynamic>? notification;
  int? hires;
  int? reported;
  bool? isBlocked;
  List<Owner?>? savedTalents;
  int? v;

  factory MyProfileModel.fromJson(Map<String, dynamic> json) => MyProfileModel(
        id: json["_id"],
        owner: Owner.fromJson(json["owner"]),
        totalSpend: json["totalSpend"],
        balance: json["balance"],
        contractsPosted: json["contractsPosted"] == null
            ? []
            : List<String?>.from(json["contractsPosted"]!.map((x) => x)),
        activeJobs: json["activeJobs"] == null
            ? []
            : List<dynamic>.from(json["activeJobs"]!.map((x) => x)),
        completedJobs: json["completedJobs"] == null
            ? []
            : List<dynamic>.from(json["completedJobs"]!.map((x) => x)),
        notification: json["notification"] == null
            ? []
            : List<dynamic>.from(json["notification"]!.map((x) => x)),
        hires: json["hires"],
        reported: json["reported"],
        isBlocked: json["isBlocked"],
        savedTalents: json["savedTalents"] == null
            ? []
            : List<Owner?>.from(
                json["savedTalents"]!.map((x) => Owner.fromJson(x))),
        v: json["__v"],
      );
}
