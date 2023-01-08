import 'package:employer_app/app/utils/app_colors.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/const_values.dart';
import '../controllers/employer_details_controller.dart';

class EmployeeDetails extends GetView<EmployerDetailsController> {
  const EmployeeDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
          const ListTile(
            leading: CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/762527/pexels-photo-762527.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              ),
            ),
            title: Text(
              'Vivek',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
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
                  const Text(
                    '2',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          sizedheight(size.height * 0.02),
          //second section ends
          kDivider1,
          sizedheight(size.height * 0.02),
          const Text(
            'I am an app developer',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ),
          sizedheight(size.height * 0.02),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          ),
        ],
      ),
    );
  }
}
