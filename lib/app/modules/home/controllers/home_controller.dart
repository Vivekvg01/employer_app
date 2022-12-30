import 'package:employer_app/app/modules/home/api/get_my_jobs_api.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    jobDatas();
    super.onInit();
  }

  RxBool isLoading = false.obs; 

  void jobDatas() async {
    Future.delayed(const Duration(seconds: 1));
    GetMyJobsApi().getMyjobs();
  }
}
