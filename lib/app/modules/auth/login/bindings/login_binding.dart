import 'package:employer_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
  }
}
