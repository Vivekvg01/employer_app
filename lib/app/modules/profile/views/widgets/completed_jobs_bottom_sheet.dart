import 'package:employer_app/app/modules/home/views/widgets/my_job_tile_widget.dart';
import 'package:employer_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';

class JobHistoryBottomSheet extends StatelessWidget {
  const JobHistoryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.9,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: AppColors.kWhiteColor,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.close),
            ),
          ),
          const Text(
            'COMPLETED JOBS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          sizedheight(Get.height * 0.03),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return MyJobsTileWidget(
                  title: Get.find<ProfileController>()
                          .completedJobList[index]
                          .title ??
                      'No Title',
                  status: Get.find<ProfileController>()
                          .completedJobList[index]
                          .status ??
                      '',
                  proposalLength: Get.find<ProfileController>()
                      .completedJobList[index]
                      .proposals!
                      .length
                      .toString(),
                  description: 'description',
                  jobId: Get.find<ProfileController>()
                      .completedJobList[index]
                      .id
                      .toString(),
                  budget: Get.find<ProfileController>()
                      .completedJobList[index]
                      .budget
                      .toString(),
                );
              },
              itemCount: Get.find<ProfileController>().completedJobList.length,
              separatorBuilder: (_, __) {
                return sizedheight(Get.height * 0.01);
              },
            ),
          ),
        ],
      ),
    );
  }
}
