import 'package:employer_app/app/common_widgets/rect_button.dart';
import 'package:employer_app/app/modules/addpost/views/widgets/add_post_textfeild.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/addpost_controller.dart';

class AddpostView extends GetView<AddpostController> {
  AddpostView({Key? key}) : super(key: key);

  final addPostformKey = GlobalKey<FormState>(); //formkey for validation

  @override
  Widget build(BuildContext context) {
    final addPostController = Get.put(AddpostController());
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
        child: Form(
          key: addPostformKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              AddPostTextFeild(
                validateText: "Title cant't be empty",
                addPostTextController: addPostController.titleController,
                hintText: 'Title for your job',
              ),
              sizedheight(Get.height * 0.03),
              //Input description
              AddPostTextFeild(
                validateText: "Description cant't be empty",
                addPostTextController: addPostController.descriptionController,
                hintText: 'Add your detailed description of your job',
                maxLines: 6,
              ),
              sizedheight(Get.height * 0.03),
              //Input budget
              AddPostTextFeild(
                addPostTextController: addPostController.budgetController,
                hintText: ' \$\t Budget',
                validateText: "Budget can't be empty",
                inputType: TextInputType.number,
              ),
              sizedheight(Get.height * 0.03),
              //Input deadline
              AddPostTextFeild(
                addPostTextController: addPostController.deadlineController,
                hintText: 'Number of days to finish',
                validateText: "Deadline is required",
                inputType: TextInputType.number,
              ),
              sizedheight(Get.height * 0.03),
              Obx(
                () => UnconstrainedBox(
                  child: Container(
                    width: Get.width * 0.5,
                    decoration: BoxDecoration(
                      color: AppColors.kLightGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: DropdownButton<String>(
                        value: addPostController.dropdownCurrentValue.value,
                        items: addPostController.dropdownValues
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          addPostController.dropdownCurrentValue.value =
                              newValue!;
                        },
                      ),
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
                    controller.onPostJobButtonClick(addPostformKey);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
