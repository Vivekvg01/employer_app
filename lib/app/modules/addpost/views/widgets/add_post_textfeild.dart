import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPostTextFeild extends GetView {
  const AddPostTextFeild({
    Key? key,
    required this.addPostTextController,
    required this.hintText,
    required this.validateText,
    this.maxLines,
    this.inputType,
  }) : super(key: key);

  final TextEditingController addPostTextController;
  final String hintText;
  final String validateText;
  final int? maxLines;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validateText;
        }
        return null;
      },
      controller: addPostTextController,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
      keyboardType: inputType,
    );
  }
}
