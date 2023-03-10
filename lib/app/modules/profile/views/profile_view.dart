import 'package:employer_app/app/modules/profile/views/widgets/change_password_bottom_sheet.dart';
import 'package:employer_app/app/modules/profile/views/widgets/completed_jobs_bottom_sheet.dart';
import 'package:employer_app/app/modules/profile/views/widgets/data_count_widgets.dart';
import 'package:employer_app/app/modules/profile/views/widgets/edit_name_bottom_sheet.dart';
import 'package:employer_app/app/modules/profile/views/widgets/sign_out_popup.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:employer_app/app/utils/const_values.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.kDarkGreen,
          title: const Text('My Profile'),
        ),
        body: GetBuilder<ProfileController>(
          init: profileController..onInit(),
          builder: (context) => SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                sizedheight(Get.height * 0.02),
                CircleAvatar(
                  backgroundImage: const NetworkImage(defaultProfileImgae),
                  radius: 48,
                  child: InkWell(
                    onTap: () {
                      print('pick image');
                    },
                  ),
                ),
                sizedheight(Get.height * 0.02),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Change Password?',
                          style: TextStyle(
                            color: AppColors.kDarkGreen,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.bottomSheet(const ChangePasswordBottmSheet());
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                sizedheight(Get.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DataCountWidget(
                      title: 'TOTAL HIRES',
                      count: profileController.totalHires!.value,
                    ),
                    sizedWidth(Get.width * 0.08),
                    DataCountWidget(
                      title: 'TOTAL SPENDS',
                      count: profileController.totalSpends!.value,
                    ),
                  ],
                ),
                sizedheight(Get.height * 0.04),
                ListTile(
                  onTap: () {
                    Get.bottomSheet(
                      EditNameBottomSheet(
                        nameController: profileController.nameController,
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    backgroundColor: AppColors.kDarkGreen,
                    radius: 17,
                    child: Icon(
                      Icons.person,
                      color: AppColors.kWhiteColor,
                      size: 17,
                    ),
                  ),
                  title: Text(profileController.nameController.text),
                  subtitle: const Padding(
                    padding: EdgeInsets.only(
                      top: 5.0,
                    ),
                    child: Text(
                      'This is not your username or pin.This name will be vibile to the employees.',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  trailing: Icon(Icons.edit, color: AppColors.kDarkGreen),
                ),
                kDivider1,
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.kDarkGreen,
                    radius: 17,
                    child: Icon(
                      Icons.email,
                      color: AppColors.kWhiteColor,
                      size: 17,
                    ),
                  ),
                  title: Text(profileController.emailController!.value.text),
                ),
                kDivider1,
                ListTile(
                  onTap: () {
                    Get.bottomSheet(
                      const JobHistoryBottomSheet(),
                      isScrollControlled: true,
                    );
                  },
                  leading: CircleAvatar(
                    backgroundColor: AppColors.kDarkGreen,
                    radius: 17,
                    child: Icon(
                      Icons.work_history,
                      color: AppColors.kWhiteColor,
                      size: 17,
                    ),
                  ),
                  title: const Text('Completed Jobs'),
                ),
                kDivider1,
                ListTile(
                  onTap: () {
                    Get.dialog(const SignOutPopUp());
                  },
                  leading: CircleAvatar(
                    backgroundColor: AppColors.kDarkGreen,
                    radius: 17,
                    child: Icon(
                      Icons.logout,
                      color: AppColors.kWhiteColor,
                      size: 17,
                    ),
                  ),
                  title: Text(
                    'Sign out',
                    style: TextStyle(
                      color: AppColors.kredColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
