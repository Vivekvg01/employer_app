import 'package:employer_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class EditNameBottomSheet extends GetView {
  EditNameBottomSheet({super.key, required this.textFeildVal});

  Rx<TextEditingController> nameController = TextEditingController().obs;
  final String textFeildVal;

  @override
  Widget build(BuildContext context) {
    nameController.value.text = textFeildVal;
    final size = MediaQuery.of(context).size;
    return Obx(
      () => Container(
        height: size.height * 0.2,
        width: double.infinity,
        color: AppColors.kWhiteColor,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter your name ',
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: nameController.value,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.find<ProfileController>().onProfileSaveButtonClicked(
                        nameController.value.text,
                      );
                    },
                    child: const Text('Save'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
