import 'package:employer_app/app/modules/contracts/controllers/contracts_controller.dart';
import 'package:employer_app/app/modules/findTalent/controllers/find_talent_controller.dart';
import 'package:employer_app/app/modules/home/controllers/home_controller.dart';
import 'package:employer_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:employer_app/app/modules/recharge/controllers/recharge_controller.dart';
import 'package:get/get.dart';
import '../../addpost/controllers/addpost_controller.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<FindTalentController>(() => FindTalentController());
    Get.lazyPut<AddpostController>(() => AddpostController());
    Get.lazyPut<ContractsController>(() => ContractsController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<RechargeController>(() => RechargeController());
  }
}
