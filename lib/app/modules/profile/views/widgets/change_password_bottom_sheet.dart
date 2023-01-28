import 'package:employer_app/app/common_widgets/auth_pass_textfeild.dart';
import 'package:employer_app/app/common_widgets/rect_button.dart';
import 'package:employer_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:employer_app/app/utils/const_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';

class ChangePasswordBottmSheet extends GetView {
  const ChangePasswordBottmSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: Get.height * 0.6,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.kWhiteColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: Get.find<ProfileController>().formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Get.find<ProfileController>()
                            .onChangepasswordBottomSheetClose();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  const Text(
                    'CHANGE PASSWORD',
                    style: bottomSheetTitleStyle,
                  ),
                  sizedheight(Get.height * 0.04),
                  AuthPassTextFeild(
                    authTextController: Get.find<ProfileController>()
                        .oldPasswordController!
                        .value,
                    passwordVisibility:
                        Get.find<ProfileController>().passwordVisibility.value,
                    suffixOnTap: () {
                      Get.find<ProfileController>().passwordVisibility.value =
                          !Get.find<ProfileController>()
                              .passwordVisibility
                              .value;
                    },
                    hintText: 'Old Password',
                  ),
                  sizedheight(Get.height * 0.03),
                  AuthPassTextFeild(
                    authTextController: Get.find<ProfileController>()
                        .newPasswordController!
                        .value,
                    passwordVisibility:
                        Get.find<ProfileController>().passwordVisibility.value,
                    hintText: 'New Password',
                    suffixOnTap: () {
                      Get.find<ProfileController>().passwordVisibility.value =
                          !Get.find<ProfileController>()
                              .passwordVisibility
                              .value;
                    },
                  ),
                  sizedheight(Get.height * 0.03),
                  SizedBox(
                    height: Get.height * 0.05,
                    width: double.infinity,
                    child: CustomRectButton(
                      buttonLabel: 'Confirm',
                      onButtonClicked: () {
                        Get.find<ProfileController>().changePassword();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
