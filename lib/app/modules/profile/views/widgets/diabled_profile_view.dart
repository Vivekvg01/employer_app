import 'package:employer_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DiasableProfileFeild extends StatelessWidget {
  const DiasableProfileFeild({
    Key? key,
    required this.textController,
    required this.icon,
  }) : super(key: key);

  final TextEditingController textController;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: false,
      controller: textController,
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
