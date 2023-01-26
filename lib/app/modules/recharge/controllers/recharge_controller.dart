import 'package:employer_app/app/modules/recharge/api/recharge_api.dart';
import 'package:employer_app/app/modules/recharge/models/purchase_history_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/purchase_details_model.dart';

class RechargeController extends GetxController
    with GetTickerProviderStateMixin {
  @override
  void onInit() {
    getPurchaseHistory();
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  late TabController tabController;

  final List<Tab> tabs = [
    const Tab(text: "BUY CONNECTS"),
    const Tab(text: "RECHARGE HISTORY"),
  ];

  RxList<Detail>? purchaseDetailsList = <Detail>[].obs;

  getPurchaseHistory() async {
    PurchaseHistoryModel? response = await RechargeApi().getPurchaseHistory();

    if (response != null) {
      if (response.details != null) {
        purchaseDetailsList?.value = response.details!;
      }
    }
  }
}
