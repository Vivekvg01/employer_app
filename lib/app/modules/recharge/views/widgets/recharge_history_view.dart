import 'package:employer_app/app/modules/recharge/controllers/recharge_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RechargeHistory extends GetView {
  const RechargeHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Obx(
          () => DataTable(
            columns: const [
              DataColumn(label: Text('No.')),
              DataColumn(
                label: Center(
                  widthFactor: 2.6,
                  child: Text('Order Id'),
                ),
              ),
              DataColumn(
                label: Center(
                  widthFactor: 0.7,
                  child: Text(
                    'Amount',
                  ),
                ),
              ),
            ],
            rows: Get.find<RechargeController>().dataRows,
          ),
        ),
      ],
    );
  }
}
