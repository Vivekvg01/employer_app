import 'package:employer_app/app/modules/addpost/api/post_job_api.dart';
import 'package:employer_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddpostController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController searchTagController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController deadlineController = TextEditingController();

  RxString dropdownCurrentValue = "Easy".obs;
  List<String> dropdownValues = ['Easy', 'Intermediate', 'Advanced'];

  String? jobTitile;
  String? status;

  void onPostJobButtonClick(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      await PostJobApi().postJob(
        titleController.text,
        descriptionController.text,
        budgetController.text,
        deadlineController.text,
        dropdownCurrentValue.toLowerCase(),
        searchTagController.text,
      );
      titleController.clear();
      descriptionController.clear();
      budgetController.clear();
      deadlineController.clear(); 
      Get.back();
      Get.find<HomeController>().onInit();
    }
  }
}
