import 'package:employer_app/app/modules/dashboard/views/dashboard_view.dart';
import 'package:employer_app/app/modules/home/views/home_view.dart';
import 'package:employer_app/app/modules/login/controllers/login_controller.dart';
import 'package:employer_app/app/modules/login/views/login_view.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final loginController = Get.put(LoginController());

  @override
  void onInit() {
    checkUserLoggedIn();
    super.onInit();
  }

  Future<void> checkUserLoggedIn() async {
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'token');
    if (token != null) {
      loginController.setIsLoggedIn(true);
    } else {
      loginController.setIsLoggedIn(false);
    }

    if (loginController.isLoggedIn.value) {
      await Future.delayed(const Duration(seconds: 3));
      Get.off(() => const DashboardView());
    } else {
      await Future.delayed(const Duration(seconds: 3));
      Get.off(() => LoginView());
    }
  }
}
