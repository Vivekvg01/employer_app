import 'package:employer_app/app/modules/jobDetails/views/widget/job_categories.dart/active_job_details.dart';
import 'package:employer_app/app/modules/jobDetails/views/widget/job_categories.dart/on_going_job_details.dart';
import 'package:employer_app/app/modules/jobDetails/views/widget/job_categories.dart/only_job_details.dart';
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
              : jobDetailsController.jobStatus.value == "active"
                  ? const ActiveJobDetails()
                  : jobDetailsController.jobStatus.value == "running"
                      ? const OnGoingJobDetials()
                      : const OnlyJobDetails();
        },
      ),
    );
  }
}
