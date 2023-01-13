import 'package:employer_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_sizes.dart';

class MyJobsTileWidget extends StatelessWidget {
  MyJobsTileWidget({
    super.key,
    required this.title,
    required this.status,
    required this.proposalLength,
    required this.description, required this.jobId,
  });

  final String title;
  final String status;
  final String proposalLength;
  final String description;
  final String jobId;

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => homeController.getJobDetailsPage(jobId),
      child: Container(
        height: size.height * 0.28,
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
              const Text(
                'budget: 20',
                style: TextStyle(
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
