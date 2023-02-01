import 'package:employer_app/app/modules/proposal_details/api/proposal_details_api.dart';
import 'package:employer_app/app/modules/proposal_details/model/proposal_model.dart';
import 'package:get/get.dart';

class ProposalDetailsController extends GetxController {
  @override
  void onInit() {
    getAllProposal();
    super.onInit();
  }

  RxString coverLetter = ''.obs;
  RxString employeeName = ''.obs;
  RxInt deadline = 0.obs;
  RxInt budget = 0.obs;
  // String

  void getAllProposal() async {
    ProposalDetailsModel? response =
        await ProposalDetailsApi().getProfileDetails('');
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
  }

  void acceptProposal() {}
}
