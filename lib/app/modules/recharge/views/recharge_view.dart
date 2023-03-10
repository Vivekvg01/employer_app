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
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
              right: 13.0,
            ),
            child: Obx(
              () => Text(
                'Balance: ₹${rechargeController.totalBalance}.00',
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: rechargeController.tabController,
        children: const [
          BuyConnects(),
          RechargeHistory(),
        ],
      ),
    );
  }
}
