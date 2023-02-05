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
      body: GetX<EmployeeDetailsController>(
        init: employeeDetailsController..onInit(),
        builder: (context) {
          return employeeDetailsController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    //first section starts
                    ListTile(
                      leading: CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(
                          employeeDetailsController.imageUrl ??
                              defaultProfileImgae,
                        ),
                      ),
                      title: Text(
                        employeeDetailsController.employeeName ?? 'No Name',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        'Freelancer',
                        style: TextStyle(
                          color: AppColors.kGreenColor,
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
                            Text(
                              employeeDetailsController.totalEarnings
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
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
                    sizedheight(size.height * 0.01),
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
                    sizedheight(size.height * 0.02),
                    const Text(
                      'Skills',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        employeeDetailsController.skillsList.length,
                        (index) {
                          return Column(
                            children: [
                              sizedheight(size.height * 0.01),
                              Text(
                                employeeDetailsController
                                    .skillsList[index]!.skill
                                    .toString(),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    sizedheight(size.height * 0.01),
                    const Text(
                      'Language',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        employeeDetailsController.languageList.length,
                        (index) {
                          return Column(
                            children: [
                              sizedheight(size.height * 0.01),
                              Text(
                                employeeDetailsController
                                        .languageList[index]?.language
                                        .toString() ??
                                    '',
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    //third section ends
                    sizedheight(size.height * 0.02),
                    const Text(
                      'Education',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    sizedheight(size.height * 0.01),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        employeeDetailsController.educationList.length,
                        (index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                employeeDetailsController
                                    .educationList[index]!.school
                                    .toString(),
                              ),
                              Text(
                                employeeDetailsController
                                    .educationList[index]!.title
                                    .toString(),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    sizedheight(size.height * 0.02),
                    kDivider1,
                    (employeeDetailsController.portFolios?.length == 0 ||
                            employeeDetailsController.portFolios?.length ==
                                null)
                        ? const SizedBox()
                        : const Text(
                            'Portfolios',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                    GridView.count(
                      shrinkWrap: true,
                      childAspectRatio: 3 / 2,
                      crossAxisCount: 2,
                      children: List.generate(
                        employeeDetailsController.portFolios?.length ?? 0,
                        (index) {
                          return UnconstrainedBox(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: AppColors.kLightGrey,
                                ),
                                child: Image.network(
                                  employeeDetailsController
                                          .portFolios?[index]!.image
                                          .toString() ??
                                      '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                    //third section ends
                  ],
                );
        },
      ),
    );
  }
}
