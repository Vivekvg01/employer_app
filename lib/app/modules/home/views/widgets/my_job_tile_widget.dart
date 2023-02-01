import 'package:employer_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_sizes.dart';

class MyJobsTileWidget extends StatelessWidget {
  const MyJobsTileWidget({
    super.key,
    required this.title,
    required this.status,
    required this.proposalLength,
    required this.description,
    required this.jobId,
    required this.budget,
  });

  final String title;
  final String status;
  final String proposalLength;
  final String description;
  final String jobId;
  final String budget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.find<HomeController>().getJobDetailsPage(jobId),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.kLightGrey,
          border: Border.all(color: AppColors.kDarkGrey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
              ),
              sizedheight(10),
              Row(
                children: [
                  const Text(
                    'STATUS : ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    status.toUpperCase(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: status == 'cancelled'
                          ? AppColors.kredColor
                          : AppColors.kGreenColor,
                    ),
                  ),
                  sizedWidth(Get.width * 0.08),
                  Text(
                    'BUDGET: \$$budget',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              sizedheight(Get.height * 0.01),
              Text(
                'PROPOSAL: $proposalLength',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
