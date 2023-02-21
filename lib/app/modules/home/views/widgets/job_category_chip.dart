import 'package:employer_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_sizes.dart';

class JobCategoryChip extends StatelessWidget {
  const JobCategoryChip({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
        () => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ChoiceChip(
                label: Text(
                  'Active Jobs',
                  style: TextStyle(
                    color: homeController.tabIndex.value == 0
                        ? AppColors.kWhiteColor
                        : AppColors.kBlackColor,
                  ),
                ),
                selected: homeController.tabIndex.value == 0,
                onSelected: (vale) {
                  homeController.tabIndex.value = 0;
                },
                selectedColor: AppColors.kDarkGreen,
              ),
              sizedWidth(Get.width * 0.03),
              ChoiceChip(
                label: Text(
                  'On going Jobs',
                  style: TextStyle(
                    color: homeController.tabIndex.value == 1
                        ? AppColors.kWhiteColor
                        : AppColors.kBlackColor,
                  ),
                ),
                selected: homeController.tabIndex.value == 1,
                onSelected: (vale) {
                  homeController.tabIndex.value = 1;
                },
                selectedColor: AppColors.kDarkGreen,
              ),
              sizedWidth(Get.width * 0.03),
              ChoiceChip(
                label: Text(
                  'Completed Jobs',
                  style: TextStyle(
                    color: homeController.tabIndex.value == 2
                        ? AppColors.kWhiteColor
                        : AppColors.kBlackColor,
                  ),
                ),
                selected: homeController.tabIndex.value == 2,
                onSelected: (vale) {
                  homeController.tabIndex.value = 2;
                },
                selectedColor: AppColors.kDarkGreen,
              ),
              sizedWidth(Get.width * 0.03),
              ChoiceChip(
                label: Text(
                  'Cancelled',
                  style: TextStyle(
                    color: homeController.tabIndex.value == 3
                        ? AppColors.kWhiteColor
                        : AppColors.kBlackColor,
                  ),
                ),
                selected: homeController.tabIndex.value == 3,
                onSelected: (vale) {
                  homeController.tabIndex.value = 3;
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
