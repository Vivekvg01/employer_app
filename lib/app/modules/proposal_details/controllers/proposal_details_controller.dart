import 'package:employer_app/app/modules/jobDetails/controllers/job_details_controller.dart';
import 'package:employer_app/app/modules/proposal_details/api/proposal_details_api.dart';
import 'package:employer_app/app/modules/proposal_details/model/proposal_model.dart';
import 'package:get/get.dart';

class ProposalDetailsController extends GetxController {
  late String propsalId;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    if (Get.find<JobDetailsController>().prpslId != null) {
      propsalId = Get.find<JobDetailsController>().prpslId!;
      getProposalDetails(propsalId);
    }
    super.onInit();
  }

  RxString coverLetter = ''.obs;
  RxString employeeName = ''.obs;
  RxInt deadline = 0.obs;
  RxInt budget = 0.obs;

  void getProposalDetails(String propsalId) async {
    isLoading(true);
    ProposalDetailsModel? response =
        await ProposalDetailsApi().getProfileDetails(propsalId);
    if (response != null) {
      if (response.owner != null) {
        if (response.owner!.name != null) {
          employeeName.value = response.owner!.name!;
        }
      }
      if (response.cover != null) {
        coverLetter.value = response.cover!;
      }
      if (response.bid != null) {
        budget.value = response.bid!;
      }
      if (response.deadline != null) {
        deadline.value = response.deadline!;
      }
    }
    isLoading(false);
  }

  void acceptProposal() {}
}
