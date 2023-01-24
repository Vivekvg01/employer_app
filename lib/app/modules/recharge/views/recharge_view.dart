import 'package:employer_app/app/modules/recharge/views/widgets/pack_tile.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/recharge_controller.dart';

class RechargeView extends GetView<RechargeController> {
  const RechargeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kDarkGreen,
        title: const Text('Recharge'),
      ),
      body: Center(
        child: Column(
          children: [
            sizedheight(size.height * 0.05),
            const PackTileWidget(),
            sizedheight(size.height * 0.03),
            const PackTileWidget(),
          ],
        ),
      ),
    );
  }
}
