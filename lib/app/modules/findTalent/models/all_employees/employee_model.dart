import 'package:employer_app/app/modules/findTalent/models/all_employees/owner_model.dart';
import 'package:employer_app/app/modules/findTalent/models/all_employees/skill_model.dart';
import 'language_model.dart';

class AllEmplyee {
  AllEmplyee({
    this.id,
    this.owner,
    this.totalEarned,
    this.languages,
    this.educations,
    this.skills,
    this.exprerience,
    this.portfolios,
    this.connects,
    this.userTitle,
    this.userInfo,
    this.completedJobs,
    this.kycApproved,
    this.isBlocked,
    this.reported,
    this.activeContracts,
    this.myProposals,
    this.pendingWithdraw,
    this.savedJobs,
    this.notification,
    this.v,
    this.kyc,
    this.image,
    this.bankDetails,
  });

  String? id;
  Owner? owner;
  double? totalEarned;
  List<Language?>? languages;
  List<String?>? educations;
  List<Skill?>? skills;
  List<dynamic>? exprerience;
  List<String?>? portfolios;
  int? connects;
  String? userTitle;
  String? userInfo;
  List<String?>? completedJobs;
  String? kycApproved;
  bool? isBlocked;
  int? reported;
  List<dynamic>? activeContracts;
  List<dynamic>? myProposals;
  int? pendingWithdraw;
  List<dynamic>? savedJobs;
  List<String?>? notification;
  int? v;
  String? kyc;
  String? image;
  String? bankDetails;

  factory AllEmplyee.fromJson(Map<String, dynamic> json) => AllEmplyee(
        id: json["_id"],
        owner: Owner.fromJson(json["owner"]),
        totalEarned: json["totalEarned"].toDouble(),
        languages: json["languages"] == null
            ? []
            : List<Language?>.from(
                json["languages"]!.map((x) => Language.fromJson(x))),
        educations: json["educations"] == null
            ? []
            : List<String?>.from(json["educations"]!.map((x) => x)),
        skills: json["skills"] == null
            ? []
            : List<Skill?>.from(json["skills"]!.map((x) => Skill.fromJson(x))),
        exprerience: json["exprerience"] == null
            ? []
            : List<dynamic>.from(json["exprerience"]!.map((x) => x)),
        portfolios: json["portfolios"] == null
            ? []
            : List<String?>.from(json["portfolios"]!.map((x) => x)),
        connects: json["connects"],
        userTitle: json["userTitle"],
        userInfo: json["userInfo"],
        completedJobs: json["completedJobs"] == null
            ? []
            : List<String?>.from(json["completedJobs"]!.map((x) => x)),
        kycApproved: json["kycApproved"],
        isBlocked: json["isBlocked"],
        reported: json["reported"],
        activeContracts: json["activeContracts"] == null
            ? []
            : List<dynamic>.from(json["activeContracts"]!.map((x) => x)),
        myProposals: json["myProposals"] == null
            ? []
            : List<dynamic>.from(json["myProposals"]!.map((x) => x)),
        pendingWithdraw: json["pendingWithdraw"],
        savedJobs: json["savedJobs"] == null
            ? []
            : List<dynamic>.from(json["savedJobs"]!.map((x) => x)),
        notification: json["notification"] == null
            ? []
            : List<String?>.from(json["notification"]!.map((x) => x)),
        v: json["__v"],
        kyc: json["kyc"],
        image: json["image"],
        bankDetails: json["bankDetails"],
      );
}