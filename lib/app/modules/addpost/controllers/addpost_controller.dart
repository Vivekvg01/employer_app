import 'package:employer_app/app/modules/addpost/api/post_job_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/response_model/post_job_response_model.dart';

class AddpostController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController searchTagController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController deadlineController = TextEditingController();

  String? jobTitile;
  String? status;

  void addPost() async {
    PostJobResModel? response = await PostJobApi().postJob(
      titleController.text,
      descriptionController.text,
      budgetController.text,
      deadlineController.text,
      "easy",
      searchTagController.text,
    );

    if (response != null) {
      jobTitile = response.job!.title;
      status = response.job!.status;
      // proposals = response.job!.proposals![0];
    }
  }
}
