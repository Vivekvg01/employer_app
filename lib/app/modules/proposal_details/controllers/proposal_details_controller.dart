import 'package:employer_app/app/modules/employeeDetails/controllers/employee_details_controller.dart';
import 'package:employer_app/app/modules/findTalent/controllers/find_talent_controller.dart';
import 'package:employer_app/app/modules/jobDetails/controllers/job_details_controller.dart';
import 'package:employer_app/app/modules/proposal_details/api/proposal_details_api.dart';
import 'package:employer_app/app/modules/proposal_details/model/proposal_model.dart';
import 'package:get/get.dart';

class ProposalDetailsController extends GetxController {
  String? propsalId;
  int? totalAmount;
  String? proposalOwnerId;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    if (Get.find<JobDetailsController>().prpslId != null) {
      propsalId = Get.find<JobDetailsController>().prpslId!;
      getProposalDetails(propsalId!);
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
        await ProposalDetailsApi().getProposalDetails(propsalId);
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
      if (response.bid != null) {
        totalAmount = response.bid;
      }
      if (response.owner?.id != null) {
        proposalOwnerId = response.owner!.id;
      }
    }
    isLoading(false);
  }

  Future<void> gotoProposalOwner() async {
    final findTalentController = Get.put(FindTalentController());
    final employeeDetailsController = Get.put(EmployeeDetailsController());
    findTalentController.employeIdVal = proposalOwnerId;
    await employeeDetailsController.getEmployeeDetails();
  }

  Future<void> acceptProposal() async {
    ProposalDetailsApi().acceptProposal(propsalId!, totalAmount!);
  }

  Future<void> rejectProposal() async {
    ProposalDetailsApi().rejectedProsal(propsalId, totalAmount!);
  }

  void shortlistPropsal() async {
    ProposalDetailsApi().shortlistProposal(propsalId);
  }
}
