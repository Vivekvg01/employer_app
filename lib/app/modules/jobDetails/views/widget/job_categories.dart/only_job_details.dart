import 'package:employer_app/app/modules/jobDetails/controllers/job_details_controller.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common_widgets/rect_button.dart';
import '../../../../../utils/app_sizes.dart';
import '../../../../../utils/const_values.dart';

class OnlyJobDetails extends GetView {
  const OnlyJobDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final jobDetailsController = Get.put(JobDetailsController());
    return ListView(
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
        sizedheight(Get.height * 0.02),
        Text(
          'Status : ${jobDetailsController.jobStatus}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        sizedheight(Get.height * 0.03),
        sizedWidth(Get.width * 0.03),
      ],
    );
  }
}
