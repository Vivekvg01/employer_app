import 'package:employer_app/app/modules/jobDetails/views/job_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_sizes.dart';

class MyJobsTileWidget extends StatelessWidget {
  const MyJobsTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Get.to(() => const JobDetailsView()),
      child: Container(
        height: size.height * 0.15,
        decoration: BoxDecoration(
          color: AppColors.kLightGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Java Developer',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
              sizedheight(10),
              const Text(
                'status: active',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              sizedheight(10),
              const Text(
                'Proposals: 0',
                style: TextStyle(
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
