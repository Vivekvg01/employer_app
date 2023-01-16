class EmployeeData {
  EmployeeData({
    this.id,
    this.totalEarned,
    this.userTitle,
    this.image,
  });

  String? id;
  double? totalEarned;
  String? userTitle;
  String? image;

  factory EmployeeData.fromJson(Map<String, dynamic> json) => EmployeeData(
        id: json["_id"],
        totalEarned: json["totalEarned"].toDouble(),
        userTitle: json["userTitle"],
        image: json["image"],
      );
}
