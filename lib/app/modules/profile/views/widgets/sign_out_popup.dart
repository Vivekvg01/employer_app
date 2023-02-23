import 'package:employer_app/app/common_widgets/rect_button.dart';
import 'package:employer_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignOutPopUp extends GetView {
  const SignOutPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Sign Out?'),
      content: const Text('Are you sure want to signout from get worker?'),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomRectButton(
              buttonLabel: 'Yes',
              backgroundColor: AppColors.kredColor,
              onButtonClicked: () async {
                Get.find<ProfileController>().signOut();
              },
            ),
            sizedWidth(Get.width * 0.02),
            CustomRectButton(
              buttonLabel: 'No',
              onButtonClicked: () {
                Get.back();
              },
            ),
          ],
        ),
      ],
    );
  }
}
