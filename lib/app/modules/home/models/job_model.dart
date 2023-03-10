class JobModel {
  JobModel({
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
  });

  String? id;
  String? owner;
  String? title;
  String? description;
  List<dynamic>? tags;
  String? level;
  int? budget;
  List<String?>? searchTag;
  List<String?>? proposals;
  String? status;
  int? deadline;
  int? v;

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        id: json["_id"],
        owner: json["owner"],
        title: json["title"],
        description: json["description"],
        tags: json["tags"] == null
            ? []
            : List<dynamic>.from(json["tags"]!.map((x) => x)),
        level: json["level"],
        budget: json["budget"],
        searchTag: json["searchTag"] == null
            ? []
            : List<String?>.from(json["searchTag"]!.map((x) => x)),
        proposals: json["proposals"] == null
            ? []
            : List<String?>.from(json["proposals"]!.map((x) => x)),
        status: json["status"],
        deadline: json["deadline"],
        v: json["__v"],
      );
}
