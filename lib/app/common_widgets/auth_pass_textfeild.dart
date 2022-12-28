import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthPassTextFeild extends StatelessWidget {
  bool passwordVisibility;
  TextEditingController authTextController = TextEditingController();
  Function suffixOnTap;
  String hintText;

  AuthPassTextFeild({
    Key? key,
    required this.authTextController,
    required this.passwordVisibility,
    required this.suffixOnTap,
    this.hintText = "Password",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password can't be empty";
        }
        return null;
      },
      obscureText: passwordVisibility,
      controller: authTextController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock_outlined),
        hintText: hintText,
        suffixIcon: IconButton(
          onPressed: () => suffixOnTap(),
          icon: Icon(
            passwordVisibility ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      ),
    );
  }
}
