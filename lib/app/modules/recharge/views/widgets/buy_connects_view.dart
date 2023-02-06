import 'package:employer_app/app/modules/recharge/views/widgets/pack_tile.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BuyConnects extends GetView {
  const BuyConnects({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const PackTileWidget(
          packAmount: 500,
          packTitle: 'Basic Pack',
        ),
        sizedheight(Get.height * 0.02),
        const PackTileWidget(
          packAmount: 1000,
          packTitle: 'Value Pack',
        ),
        sizedheight(Get.height * 0.02),
        const PackTileWidget(
          packTitle: 'Premium Pack',
          packAmount: 5000,
        ),
      ],
    );
  }
}
