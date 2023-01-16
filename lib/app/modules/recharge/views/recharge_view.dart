import 'package:employer_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/recharge_controller.dart';

class RechargeView extends GetView<RechargeController> {
  const RechargeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kDarkGreen,
        title: const Text('RechargeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RechargeView',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
