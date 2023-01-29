import 'package:employer_app/app/modules/findTalent/controllers/find_talent_controller.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';

class FindTalendSwithWidget extends GetView {
  const FindTalendSwithWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          ChoiceChip(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 12.0),
            label: Text(
              'All',
              style: TextStyle(color: AppColors.kWhiteColor),
            ),
            selected: Get.find<FindTalentController>().tabIndex.value == 0,
            onSelected: (vale) {
              Get.find<FindTalentController>().tabIndex.value = 0;
            },
            selectedColor: AppColors.kDarkGreen,
          ),
          sizedWidth(Get.width * 0.03),
          ChoiceChip(
            padding:
                const EdgeInsets.symmetric(horizontal: 35.0, vertical: 12.0),
            label: Text(
              'Saved',
              style: TextStyle(color: AppColors.kWhiteColor),
            ),
            selected: Get.find<FindTalentController>().tabIndex.value == 1,
            onSelected: (vale) {
              Get.find<FindTalentController>().tabIndex.value = 1;
            },
            selectedColor: AppColors.kDarkGreen,
          ),
        ],
      ),
    );
  }
}
