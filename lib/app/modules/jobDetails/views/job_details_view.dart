import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../controllers/job_details_controller.dart';

class JobDetailsView extends GetView<JobDetailsController> {
  const JobDetailsView({Key? key}) : super(key: key);
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
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Java developer',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          sizedheight(size.height * 0.01),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          ),
          sizedheight(size.height * 0.02),
          const Text(
            'Budget : \$30',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const Text(
            'Deadline : 10 days',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const Text(
            'Difficulty : Intermediate',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          sizedheight(size.height * 0.03),
          ElevatedButton(
            onPressed: () {},
            style:
                ElevatedButton.styleFrom(backgroundColor: AppColors.kredColor),
            child: const Text('Cancel Job'),
          ),
        ],
      ),
    );
  }
}
