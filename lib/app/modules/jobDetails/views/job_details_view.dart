import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:employer_app/app/utils/const_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../controllers/job_details_controller.dart';

class JobDetailsView extends GetView<JobDetailsController> {
  JobDetailsView({Key? key}) : super(key: key);

  final jobDetailsController = Get.put(JobDetailsController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              : ListView(
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
                    sizedheight(size.height * 0.01),
                    Text(
                      jobDetailsController.jobDescription ?? "No description",
                      style: const TextStyle(fontSize: 17),
                    ),
                    sizedheight(size.height * 0.01),
                    kDivider1,
                    sizedheight(size.height * 0.01),
                    const Text(
                      'Budget : \$30',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    sizedheight(size.height * 0.02),
                    const Text(
                      'Deadline : 10 days',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    sizedheight(size.height * 0.02),
                    const Text(
                      'Difficulty : \$30',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    sizedheight(size.height * 0.03),
                    kDivider1,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            jobDetailsController.gotToViewPropsals();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Text('View Proposals'),
                        ),
                        sizedWidth(size.width * 0.03),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade400,
                          ),
                          child: const Text('Cance Job'),
                        ),
                      ],
                    ),
                  ],
                );
        },
      ),
    );
  }
}
