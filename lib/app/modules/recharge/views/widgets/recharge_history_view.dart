import 'package:employer_app/app/modules/recharge/controllers/recharge_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RechargeHistory extends StatelessWidget {
  const RechargeHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Obx(
          () => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('No.')),
                DataColumn(
                  label: Center(
                    widthFactor: 3.0,
                    child: Text('Order Id'),
                  ),
                ),
                DataColumn(
                  label: Center(
                    widthFactor: 1.7,
                    child: Text('Payement Id'),
                  ),
                ),
                DataColumn(label: Text('Amount')),
              ],
              rows: Get.find<RechargeController>().dataRows,
            ),
          ),
        ),
      ],
    );
  }
}
