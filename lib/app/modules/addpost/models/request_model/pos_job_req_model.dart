class PostJobReqModel {
  PostJobReqModel({
    required this.title,
    required this.description,
    required this.budget,
    required this.deadline,
    required this.level,
    required this.searchTag,
  });

  String title;
  String description;
  String budget;
  String deadline;
  String level;
  String searchTag;

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "budget": budget,
        "deadline": deadline,
        "level": level,
        "searchTag": searchTag,
      };
}
