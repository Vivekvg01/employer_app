import 'package:employer_app/app/modules/home/controllers/home_controller.dart';
import 'package:employer_app/app/modules/jobDetails/api/job_details_api.dart';
import 'package:employer_app/app/modules/jobDetails/model/job_details_model.dart';
import 'package:employer_app/app/modules/proposals/views/proposals_view.dart';
import 'package:get/get.dart';

class JobDetailsController extends GetxController {
  final homeController = Get.put(HomeController());
  late String jobId;

  @override
  void onInit() {
    jobId = homeController.jobIdVal!;
    getJobDetails();
    super.onInit();
  }

  RxBool isLoading = false.obs;

  String? jobTitle;
  String? jobDescription;
  String? difficultyLevel;
  int? budget;
  int? deadline;

  void getJobDetails() async {
    isLoading(true);
    JobDetailsModel? response = await JobDetailsApi().getJobDetails(jobId);

    if (response != null) {
      if (response.title != null) {
        jobTitle = response.title;
      }
      if (response.description != null) {
        jobDescription = response.description;
      }
      if (response.deadline != null) {
        deadline = response.deadline;
      }
      if (response.budget != null) {
        budget = response.budget;
      }
      if (response.level != null) {
        difficultyLevel = response.level;
      }
    }
    isLoading(false);
  }

  void gotToViewPropsals() {
    Get.to(() => const ProposalsView());
  }
}
