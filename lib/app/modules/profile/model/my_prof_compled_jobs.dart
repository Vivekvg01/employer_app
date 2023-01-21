class CompletedJob {
  CompletedJob({
    this.id,
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
    this.v,
    this.acceptedProposal,
  });

  String? id;
  String? owner;
  String? title;
  String? description;
  List<dynamic>? tags;
  String? level;
  int? budget;
  List<String>? searchTag;
  List<String>? proposals;
  String? status;
  int? deadline;
  int? v;
  String? acceptedProposal;

  factory CompletedJob.fromJson(Map<String, dynamic> json) => CompletedJob(
        id: json["_id"],
        owner: json["owner"],
        title: json["title"],
        description: json["description"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        level: json["level"],
        budget: json["budget"],
        searchTag: List<String>.from(json["searchTag"].map((x) => x)),
        proposals: List<String>.from(json["proposals"].map((x) => x)),
        status: json["status"],
        deadline: json["deadline"],
        v: json["__v"],
        acceptedProposal: json["acceptedProposal"],
      );
}