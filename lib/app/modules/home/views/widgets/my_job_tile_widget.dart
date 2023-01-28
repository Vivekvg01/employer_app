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
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              sizedheight(10),
              Text(
                'status: $status',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              sizedheight(10),
              Text(
                'budget: \$$budget',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              sizedheight(10),
              Text(
                'Proposals: $proposalLength',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
