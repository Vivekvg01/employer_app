import 'package:employer_app/app/modules/recharge/models/purchase_details_model.dart';

class PurchaseHistoryModel {
  PurchaseHistoryModel({
    this.id,
    this.owner,
    this.details,
    this.v,
  });

  String? id;
  String? owner;
  List<Detail>? details;
  int? v;

  factory PurchaseHistoryModel.fromJson(Map<String, dynamic> json) =>
      PurchaseHistoryModel(
        id: json["_id"],
        owner: json["owner"],
        details:
            List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
        v: json["__v"],
      );
}
