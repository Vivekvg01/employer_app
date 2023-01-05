import 'package:employer_app/app/modules/auth/login/controllers/login_controller.dart';
import 'package:employer_app/app/modules/auth/login/views/login_view.dart';
import 'package:employer_app/app/modules/home/api/get_my_jobs_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../models/get_myjobs_model.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    jobDatas();
    super.onInit();
  }

  final loginController = Get.put(LoginController());

  Future<void> logout() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
    loginController.setIsLoggedIn(false);
    Get.offAll(() => LoginView());
  }

  RxBool isLoading = false.obs;

  List<Map> myJobsList = [];

  void jobDatas() async {
    Future.delayed(const Duration(seconds: 1));
    MyJobs? response = await GetMyJobsApi().getMyjobs();
  }
}
