// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import 'package:employer_app/app/utils/app_colors.dart';

class DiasableProfileFeild extends StatelessWidget {
  DiasableProfileFeild({
    Key? key,
    required this.icon,
    required this.textController,
  }) : super(key: key);

  Rx<TextEditingController> textController = TextEditingController().obs;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: false,
      controller: textController.value,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: AppColors.kDarkGreen,
        ),
        suffixIcon: Icon(
          Icons.edit,
          color: AppColors.kDarkGreen,
        ),
      ),
    );
  }
}
