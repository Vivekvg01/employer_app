import 'package:employer_app/app/modules/home/api/get_my_jobs_api.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    jobDatas();
    super.onInit();
  }

  void jobDatas() async {
    Future.delayed(const Duration(seconds: 1));
    GetMyJobsApi().getMyjobs();
  }
}
