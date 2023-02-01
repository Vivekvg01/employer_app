import 'package:employer_app/app/common_widgets/rect_button.dart';
import 'package:employer_app/app/modules/addpost/views/widgets/add_post_textfeild.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/addpost_controller.dart';

// ignore: must_be_immutable
class AddpostView extends GetView<AddpostController> {
  const AddpostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.kBlackColor,
        ),
        title: Text(
          'Add Post',
          style: TextStyle(color: AppColors.kBlackColor),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: controller.addPostformKey,
            child: Column(
              children: [
                AddPostTextFeild(
                  validateText: "Title cant't be empty",
                  addPostTextController: controller.titleController,
                  hintText: 'Title for your job',
                ),
                sizedheight(Get.height * 0.03),
                //Input description
                AddPostTextFeild(
                  validateText: "Description cant't be empty",
                  addPostTextController: controller.descriptionController,
                  hintText: 'Add your detailed description of your job',
                  maxLines: 6,
                ),
                sizedheight(Get.height * 0.03),
                // TextFormField(
                //   controller: controller.searchTagController,
                //   decoration: const InputDecoration(
                //     hintText: 'Add Search tags',
                //     border: OutlineInputBorder(),
                //   ),
                // ),
                //sizedheight(size.height * 0.03),

                //Input budget
                AddPostTextFeild(
                  addPostTextController: controller.budgetController,
                  hintText: ' \$\t Budget',
                  validateText: "Budget can't be empty",
                ),
                sizedheight(Get.height * 0.03),
                //Input deadline
                AddPostTextFeild(
                  addPostTextController: controller.deadlineController,
                  hintText: 'Number of days to finish',
                  validateText: "Deadline is required",
                ),
                sizedheight(Get.height * 0.03),
                Obx(
                  () => Container(
                    width: Get.width * 0.5,
                    decoration: BoxDecoration(
                      color: AppColors.kLightGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: DropdownButton<String>(
                        value: controller.dropdownCurrentValue.value,
                        items: controller.dropdownValues.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          controller.dropdownCurrentValue.value = newValue!;
                        },
                      ),
                    ),
                  ),
                ),
                sizedheight(Get.height * 0.03),
                SizedBox(
                  width: double.infinity,
                  height: Get.height * 0.06,
                  child: CustomRectButton(
                    buttonLabel: 'Post Jobs',
                    onButtonClicked: () {
                      controller.onPostJobButtonClick();
                    },
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
