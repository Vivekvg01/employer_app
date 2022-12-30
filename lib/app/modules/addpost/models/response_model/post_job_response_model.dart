class PostJobResModel {
  PostJobResModel({
    this.job,
    this.user,
  });

  Job? job;
  User? user;

  factory PostJobResModel.fromJson(Map<String, dynamic> json) =>
      PostJobResModel(
        job: Job.fromJson(json["job"]),
        user: User.fromJson(json["user"]),
      );
}

class Job {
  Job({
    this.owner,
    this.title,
    this.description,
    this.tags,
    this.level,
    this.budget,
    this.searchTag,
    this.proposals,
    this.status,
    this.deadline,
    this.id,
    this.v,
  });

  String? owner;
  String? title;
  String? description;
  List<dynamic>? tags;
  String? level;
  int? budget;
  List<String>? searchTag;
  List<dynamic>? proposals;
  String? status;
  int? deadline;
  String? id;
  int? v;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        owner: json["owner"],
        title: json["title"],
        description: json["description"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        level: json["level"],
        budget: json["budget"],
        searchTag: List<String>.from(json["searchTag"].map((x) => x)),
        proposals: List<dynamic>.from(json["proposals"].map((x) => x)),
        status: json["status"],
        deadline: json["deadline"],
        id: json["_id"],
        v: json["__v"],
      );
}

class User {
  User({
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
  String? owner;
  int? totalSpend;
  int? balance;
  List<String>? contractsPosted;
  List<dynamic>? activeJobs;
  List<dynamic>? completedJobs;
  List<dynamic>? notification;
  int? hires;
  int? reported;
  bool? isBlocked;
  List<dynamic>? savedTalents;
  int? v;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        owner: json["owner"],
        totalSpend: json["totalSpend"],
        balance: json["balance"],
        contractsPosted:
            List<String>.from(json["contractsPosted"].map((x) => x)),
        activeJobs: List<dynamic>.from(json["activeJobs"].map((x) => x)),
        completedJobs: List<dynamic>.from(json["completedJobs"].map((x) => x)),
        notification: List<dynamic>.from(json["notification"].map((x) => x)),
        hires: json["hires"],
        reported: json["reported"],
        isBlocked: json["isBlocked"],
        savedTalents: List<dynamic>.from(json["savedTalents"].map((x) => x)),
        v: json["__v"],
      );
}
