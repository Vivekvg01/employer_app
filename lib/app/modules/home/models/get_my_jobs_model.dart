// class GetMyJobs {
//   GetMyJobs({
//     this.id,
//     this.owner,
//     this.title,
//     this.description,
//     this.tags,
//     this.level,
//     this.budget,
//     this.searchTag,
//     this.proposals,
//     this.status,
//     this.deadline,
//     this.v,
//   });

//   String? id;
//   Owner? owner;
//   String? title;
//   String? description;
//   List<dynamic>? tags;
//   Level? level;
//   int? budget;
//   List<String>? searchTag;
//   List<String>? proposals;
//   Status? status;
//   int? deadline;
//   int? v;

//   factory GetMyJobs.fromJson(Map<String, dynamic> json) => GetMyJobs(
//         id: json["_id"],
//         owner: ownerValues.map[json["owner"]],
//         title: json["title"],
//         description: json["description"],
//         tags: List<dynamic>.from(json["tags"].map((x) => x)),
//         level: levelValues.map[json["level"]],
//         budget: json["budget"] == null ? null : json["budget"],
//         searchTag: List<String>.from(json["searchTag"].map((x) => x)),
//         proposals: List<String>.from(json["proposals"].map((x) => x)),
//         status: statusValues.map![json["status"]],
//         deadline: json["deadline"] == null ? null : json["deadline"],
//         v: json["__v"],
//       );
// }

// enum Level { INTERMEDIATE, ADVANCED, EASY }

// final levelValues = EnumValues({
//   "advanced": Level.ADVANCED,
//   "easy": Level.EASY,
//   "intermediate": Level.INTERMEDIATE
// });

// enum Owner { THE_639809_F2_A527_D75011_EB2_C03 }

// final ownerValues = EnumValues(
//     {"639809f2a527d75011eb2c03": Owner.THE_639809_F2_A527_D75011_EB2_C03});

// enum Status { CANCELLED, ACTIVE }

// final statusValues =
//     EnumValues({"active": Status.ACTIVE, "cancelled": Status.CANCELLED});

// class EnumValues<T> {
//   Map<String, T>? map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => MapEntry(v, k));
//     } 
//     return reverseMap;
//   }
// }
