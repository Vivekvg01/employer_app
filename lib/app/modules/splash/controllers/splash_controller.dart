import 'package:employer_app/app/modules/login/views/login_view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    toLogin();
    super.onInit();
  }

  void toLogin() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Get.off(() =>  LoginView());
  }
}
