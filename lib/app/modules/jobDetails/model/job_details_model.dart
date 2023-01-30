import 'package:employer_app/app/modules/jobDetails/model/proposal_model.dart';

class JobDetailsModel {
  JobDetailsModel({
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
  List<String>? searchTag;
  List<Proposal>? proposals;
  String? status;
  int? deadline;
  int? v;

  factory JobDetailsModel.fromJson(Map<String, dynamic> json) =>
      JobDetailsModel(
        id: json["_id"],
        owner: json["owner"],
        title: json["title"],
        description: json["description"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        level: json["level"],
        budget: json["budget"],
        searchTag: List<String>.from(json["searchTag"].map((x) => x)),
        proposals: List<Proposal>.from(
            json["proposals"].map((x) => Proposal.fromJson(x))),
        status: json["status"],
        deadline: json["deadline"],
        v: json["__v"],
      );
}


