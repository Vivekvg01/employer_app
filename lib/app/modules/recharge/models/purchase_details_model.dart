class Detail {
  Detail({
    this.amount,
    this.orderId,
    this.paymentId,
    this.method,
    this.month,
  });

  int? amount;
  String? orderId;
  String? paymentId;
  String? method;
  int? month;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        amount: json["amount"],
        orderId: json["orderId"],
        paymentId: json["paymentId"],
        method: json["method"],
        month: json["month"],
      );
}