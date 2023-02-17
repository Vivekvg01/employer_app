import 'package:employer_app/app/modules/home/controllers/home_controller.dart';
import 'package:employer_app/app/modules/jobDetails/api/job_details_api.dart';
import 'package:employer_app/app/modules/jobDetails/model/job_details_model.dart';
import 'package:employer_app/app/modules/proposal_details/views/proposal_details_view.dart';
import 'package:get/get.dart';
import '../model/proposal_model.dart';

class JobDetailsController extends GetxController {
  late String jobId;

  @override
  void onInit() {
    //assigning job id from the previous page controller.
    jobId = Get.find<HomeController>().jobIdVal!;
    getJobDetails();
    super.onInit();
  }

  RxBool isLoading = false.obs;

  RxInt tabIndex = 0.obs;

  String? jobTitle;
  String? jobDescription;
  String? difficultyLevel;
  RxString jobStatus = ''.obs;

  int? budget;
  int? deadline;

  String? prpslId;

  RxList<Proposal> porposalList = <Proposal>[].obs;

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
      if (response.proposals != null) {
        porposalList.value = response.proposals!;
      }
      if (response.status != null) {
        jobStatus.value = response.status!;
      }
    }
    isLoading(false);
  }

  //on approveJob

  void onApproveJobButtonClick() {
    JobDetailsApi().approveJob(jobId);
  }

  void goToProposalDetails(String? proposalId) {
    if (proposalId != null) {
      prpslId = proposalId;
      Get.to(
        () => const ProposalDetailsView(),
        arguments: proposalId,
      );
    }
  }

  //Cancel jobs
  Future<void> onCancelJobButtonClicked() async {
    await JobDetailsApi().cancelJob(jobId);
  }
}
