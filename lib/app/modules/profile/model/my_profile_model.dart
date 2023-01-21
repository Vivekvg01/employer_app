import 'my_prof_compled_jobs.dart';
import 'my_prof_notificaiton.dart';
import 'my_prof_owner.dart';

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
  List<String>? contractsPosted;
  List<dynamic>? activeJobs;
  List<CompletedJob>? completedJobs;
  List<Notification>? notification;
  int? hires;
  int? reported;
  bool? isBlocked;
  List<Owner>? savedTalents;
  int? v;

  factory MyProfileModel.fromJson(Map<String, dynamic> json) => MyProfileModel(
        id: json["_id"],
        owner: Owner.fromJson(json["owner"]),
        totalSpend: json["totalSpend"],
        balance: json["balance"],
        contractsPosted:
            List<String>.from(json["contractsPosted"].map((x) => x)),
        activeJobs: List<dynamic>.from(json["activeJobs"].map((x) => x)),
        completedJobs: List<CompletedJob>.from(
            json["completedJobs"].map((x) => CompletedJob.fromJson(x))),
        notification: List<Notification>.from(
            json["notification"].map((x) => Notification.fromJson(x))),
        hires: json["hires"],
        reported: json["reported"],
        isBlocked: json["isBlocked"],
        savedTalents: List<Owner>.from(
            json["savedTalents"].map((x) => Owner.fromJson(x))),
        v: json["__v"],
      );
}






