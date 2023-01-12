import 'package:employer_app/app/utils/app_colors.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/const_values.dart';
import '../controllers/employee_details_controller.dart';

class EmployeeDetailsView extends GetView<EmployeeDetailsController> {
  EmployeeDetailsView({Key? key}) : super(key: key);

  final employeeDetailsController = Get.put(EmployeeDetailsController());

  @override
  Widget build(BuildContext context) {
    employeeDetailsController.onInit();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.kDarkGreen,
        title: Text(
          'Emoployee Profile',
          style: TextStyle(color: AppColors.kWhiteColor),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          //first section starts
          ListTile(
            leading: const CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/762527/pexels-photo-762527.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              ),
            ),
            title: Text(
              employeeDetailsController.employeeName ?? 'No Name',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: const Text(
              'Since:01-01-2023',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          //first section ends
          kDivider1,
          //Second section starts
          sizedheight(size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text(
                    "Total Earnings",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  sizedheight(size.height * 0.01),
                  const Text(
                    '\$200.00',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              sizedWidth(size.width * 0.2),
              Column(
                children: [
                  const Text(
                    "Total Jobs",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  sizedheight(size.height * 0.01),
                  Text(
                    employeeDetailsController.completedJobs?.length
                            .toString() ??
                        '0',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          sizedheight(size.height * 0.02),
          //second section ends
          kDivider1,
          //third section starts
          sizedheight(size.height * 0.02),
          const Text(
            'Skills',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              3,
              (index) {
                return Column(
                  children: const [
                    //sizedheight(size),
                    Text('Getx'),
                  ],
                );
              },
            ),
          ),
          const Text(
            'Language',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              3,
              (index) {
                return Column(
                  children: [
                    sizedheight(size.height * 0.02),
                    const Text('Getx'),
                  ],
                );
              },
            ),
          ),
          //third section ends
          sizedheight(size.height * 0.02),
          Text(
            employeeDetailsController.userTitle ?? 'No title',
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ),
          sizedheight(size.height * 0.02),
          Text(
            employeeDetailsController.userInfo ?? '',
          ),
        ],
      ),
    );
  }
}
