class Chat {
  Chat({
    this.message,
    this.user,
  });

  String? message;
  String? user;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        message: json["message"],
        user: json["user"],
      );
}