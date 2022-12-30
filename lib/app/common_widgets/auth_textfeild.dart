// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class AuthTextFeild extends StatelessWidget {
  String hintText;
  String validateText;
  IconData icon;
  TextEditingController authTextController = TextEditingController();
  String? emailvalidationMessage;

  AuthTextFeild({
    Key? key,
    required this.hintText,
    required this.validateText,
    required this.icon,
    required this.authTextController,
    this.emailvalidationMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validateText;
        } else if (emailvalidationMessage != null) {
          if (!RegExp(r'.+@.+\.com$').hasMatch(value)) {
            return emailvalidationMessage;
          }
        }
        return null;
      },
      controller: authTextController,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
      ),
    );
  }
}
