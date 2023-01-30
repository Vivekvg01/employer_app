import 'package:get/get.dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/recharge_controller.dart';

class RechargeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RechargeController>(() => RechargeController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
