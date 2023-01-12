import 'package:employer_app/app/modules/auth/login/controllers/login_controller.dart';
import 'package:employer_app/app/modules/home/api/get_my_jobs_api.dart';
import 'package:employer_app/app/modules/home/models/job_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../auth/login/views/login_view.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    jobDatas();
    super.onInit();
  }

  final _loginController = Get.put(LoginController());
  //logout funcion clears the token
  Future<void> logout() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
    _loginController.setIsLoggedIn(false);
    Get.offAll(() => LoginView());
  }

  RxBool isLoading = false.obs;

  List<JobModel> myJobsList = [];

  //Api call on initilize page
  void jobDatas() async {
    isLoading(true);
    var response = await GetMyJobsApi().getMyjobs();
    if (response != null) {
      if (response.jobModel != null) {
        myJobsList = response.jobModel!;
      }
      isLoading(false);
    }
  }
}
