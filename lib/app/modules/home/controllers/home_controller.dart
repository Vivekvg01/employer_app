import 'package:employer_app/app/modules/home/api/get_my_jobs_api.dart';
import 'package:get/get.dart';

import '../models/get_myjobs_model.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    jobDatas();
    super.onInit();
  }

  RxBool isLoading = false.obs;

  List<Map> myJobsList = [];

  void jobDatas() async {
    Future.delayed(const Duration(seconds: 1));
    MyJobs? response = await GetMyJobsApi().getMyjobs();
  }
}
