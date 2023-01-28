import 'package:employer_app/app/modules/addpost/api/post_job_api.dart';
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

  void addPost() async {
    await PostJobApi().postJob(
      titleController.text,
      descriptionController.text,
      budgetController.text,
      deadlineController.text,
      dropdownCurrentValue.toLowerCase(),
      searchTagController.text,
    );
  }
}
