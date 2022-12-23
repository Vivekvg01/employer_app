import 'package:employer_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
