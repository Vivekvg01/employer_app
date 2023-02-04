import 'package:employer_app/app/modules/jobDetails/controllers/job_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_sizes.dart';

class ProposalCategoryChip extends StatelessWidget {
  const ProposalCategoryChip({super.key});

  @override
  Widget build(BuildContext context) {
    final jobDetailsController = Get.put(JobDetailsController());
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
        () => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ChoiceChip(
                label: Text(
                  'Active Propsal  (${jobDetailsController.porposalList.length})',
                  style: TextStyle(color: AppColors.kWhiteColor),
                ),
                selected: jobDetailsController.tabIndex.value == 0,
                onSelected: (vale) {
                  jobDetailsController.tabIndex.value = 0;
                },
                selectedColor: AppColors.kDarkGreen,
              ),
              sizedWidth(Get.width * 0.03),
              ChoiceChip(
                label: Text(
                  'Rejected Proposal',
                  style: TextStyle(color: AppColors.kWhiteColor),
                ),
                selected: jobDetailsController.tabIndex.value == 1,
                onSelected: (vale) {
                  jobDetailsController.tabIndex.value = 1;
                },
                selectedColor: AppColors.kDarkGreen,
              ),
              sizedWidth(Get.width * 0.03),
              ChoiceChip(
                label: Text(
                  'ShortListed Proposal',
                  style: TextStyle(color: AppColors.kWhiteColor),
                ),
                selected: jobDetailsController.tabIndex.value == 2,
                onSelected: (vale) {
                  jobDetailsController.tabIndex.value = 2;
                },
                selectedColor: AppColors.kDarkGreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
