import 'dart:ui';

import 'package:employer_app/app/modules/recharge/views/widgets/buy_connects_view.dart';
import 'package:employer_app/app/modules/recharge/views/widgets/recharge_history_view.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/recharge_controller.dart';

class RechargeView extends GetView<RechargeController> {
  const RechargeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final rechargeController = Get.put(RechargeController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kDarkGreen,
        title: const Text('Recharge'),
        bottom: TabBar(
          controller: rechargeController.tabController,
          tabs: rechargeController.tabs,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              top: 12,
              right: 12,
            ),
            child: Text(
              'Balance: 5000',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: rechargeController.tabController,
        children: [
          BuyConnects(),
          RechargeHistory(),
        ],
      ),
    );
  }
}
