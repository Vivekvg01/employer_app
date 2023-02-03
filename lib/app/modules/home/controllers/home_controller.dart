import 'package:employer_app/app/modules/all_chats/views/all_chats_view.dart';
import 'package:employer_app/app/modules/auth/login/controllers/login_controller.dart';
import 'package:employer_app/app/modules/home/api/get_my_jobs_api.dart';
import 'package:employer_app/app/modules/home/models/job_model.dart';
import 'package:employer_app/app/modules/jobDetails/views/job_details_view.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../auth/login/views/login_view.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    jobDatas();
    super.onInit();
  }

  RxInt tabIndex = 0.obs;

  void gotToChat() {
    Get.to(() => const AllChatsView());
  }

  RxBool isLoading = false.obs;
  String? jobIdVal;

  RxList<JobModel> myAllJobsList = <JobModel>[].obs;

  ///Filtering the jobs jobs according to the status

  List<JobModel> get activeJobList =>
      myAllJobsList.where((element) => element.status == 'active').toList();

  List<JobModel> get completedJobList =>
      myAllJobsList.where((element) => element.status == 'completed').toList();

  List<JobModel> get onGoingJobList =>
      myAllJobsList.where((element) => element.status == 'running').toList();

  List<JobModel> get cancelledJobList =>
      myAllJobsList.where((element) => element.status == 'cancelled').toList();

  //Api call on initilize page
  void jobDatas() async {
    isLoading(true);
    var response = await GetMyJobsApi().getMyjobs();
    if (response != null) {
      if (response.jobModel != null) {
        //Add the reversed response list to show the frequently added list to the first.
        myAllJobsList.value = response.jobModel!.reversed.toList();
      }
      isLoading(false);
    }
  }

  void getJobDetailsPage(String? jobId) async {
    if (jobId != null) {
      jobIdVal = jobId;
      Get.to(
        () => const JobDetailsView(),
      );
    }
  }
}
