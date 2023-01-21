class Notification {
  Notification({
    this.id,
    this.owner,
    this.message,
    this.v,
  });

  String? id;
  String? owner;
  String? message;
  int? v;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["_id"],
        owner: json["owner"],
        message: json["message"],
        v: json["__v"],
      );
}