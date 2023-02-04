import 'package:employer_app/app/common_widgets/rect_button.dart';
import 'package:employer_app/app/modules/jobDetails/views/widget/chip/propsal_category_chip.dart';
import 'package:employer_app/app/modules/jobDetails/views/widget/proposal_categories/active_propsal.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:employer_app/app/utils/const_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../controllers/job_details_controller.dart';

class JobDetailsView extends GetView<JobDetailsController> {
  const JobDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jobDetailsController = Get.put(JobDetailsController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.kDarkGreen,
        title: Text(
          'Job details',
          style: TextStyle(color: AppColors.kWhiteColor),
        ),
      ),
      body: GetX<JobDetailsController>(
        builder: (context) {
          return jobDetailsController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    Text(
                      jobDetailsController.jobTitle ?? "No title",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    kDivider1,
                    sizedheight(Get.height * 0.01),
                    Text(
                      jobDetailsController.jobDescription ?? "No description",
                      style: const TextStyle(fontSize: 17),
                    ),
                    sizedheight(Get.height * 0.01),
                    kDivider1,
                    sizedheight(Get.height * 0.01),
                    Text(
                      'Budget : \$${jobDetailsController.budget}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    sizedheight(Get.height * 0.02),
                    Text(
                      'Deadline : ${jobDetailsController.deadline} days',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    sizedheight(Get.height * 0.02),
                    Text(
                      'Difficulty : ${jobDetailsController.difficultyLevel}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    sizedheight(Get.height * 0.03),
                    kDivider1,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        sizedWidth(Get.width * 0.03),
                        CustomRectButton(
                          buttonLabel: 'Cancel Jobs',
                          backgroundColor: AppColors.kredColor,
                          onButtonClicked: () {
                            jobDetailsController.onCancelJobButtonClicked();
                          },
                        )
                      ],
                    ),
                    sizedWidth(Get.width * 0.03),
                    kDivider1,
                    ListView(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      children: [
                        const ProposalCategoryChip(),
                        jobDetailsController.tabIndex.value == 0
                            ? const ActivePropsal()
                            : Container(),
                      ],
                    ),
                  ],
                );
        },
      ),
    );
  }
}
