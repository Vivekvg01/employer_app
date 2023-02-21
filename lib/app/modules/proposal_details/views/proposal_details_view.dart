import 'package:employer_app/app/common_widgets/rect_button.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:employer_app/app/utils/const_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/proposal_details_controller.dart';

class ProposalDetailsView extends GetView<ProposalDetailsController> {
  const ProposalDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final proposalDetailsController = Get.put(ProposalDetailsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kDarkGreen,
        title: const Text('Proposal Details'),
      ),
      body: Obx(
        () => proposalDetailsController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 15.0,
                  ),
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 13.0),
                      decoration: BoxDecoration(
                        color: AppColors.kWhiteColor,
                        boxShadow: const [
                          BoxShadow(blurRadius: 1.0),
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'PROPOSAL',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          kDivider1,
                          sizedheight(Get.height * 0.01),
                          Obx(
                            () => Text(
                              proposalDetailsController.coverLetter.value,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          sizedheight(Get.height * 0.023),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Bid :\t',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Obx(
                                    () => Text(
                                      '\$${proposalDetailsController.budget}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Deadline :\t',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Obx(
                                    () => Text(
                                      '${proposalDetailsController.deadline} Days',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          sizedheight(Get.height * 0.01),
                          Obx(
                            () => CustomRectButton(
                              buttonLabel:
                                  'Proposed By : ${proposalDetailsController.employeeName}',
                              onButtonClicked: () {
                                proposalDetailsController.gotoProposalOwner(
                                  controller.proposalOwnerId,
                                );
                              },
                              borderRadius: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    sizedheight(Get.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomRectButton(
                          buttonLabel: 'Accept',
                          onButtonClicked: () {
                            proposalDetailsController.acceptProposal();
                          },
                          borderRadius: 15,
                        ),
                        CustomRectButton(
                          buttonLabel: 'Reject',
                          backgroundColor: AppColors.kredColor,
                          onButtonClicked: () {
                            proposalDetailsController.rejectProposal();
                          },
                        ),
                        CustomRectButton(
                          buttonLabel: 'Shortlist',
                          onButtonClicked: () {
                            proposalDetailsController.shortlistPropsal();
                          },
                          backgroundColor: AppColors.klightblueColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
