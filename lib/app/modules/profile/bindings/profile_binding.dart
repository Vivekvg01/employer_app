import 'package:employer_app/app/modules/recharge/controllers/recharge_controller.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<RechargeController>(
      () => RechargeController(),
    );
  }
}
