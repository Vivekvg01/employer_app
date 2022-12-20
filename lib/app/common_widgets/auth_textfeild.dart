// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AuthTextFeild extends StatelessWidget {
  String hintText;
  String validateText;
  IconData icon;
  TextEditingController authTextController = TextEditingController();

  AuthTextFeild({
    Key? key,
    required this.hintText,
    required this.validateText,
    required this.icon,
    required this.authTextController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validateText;
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
