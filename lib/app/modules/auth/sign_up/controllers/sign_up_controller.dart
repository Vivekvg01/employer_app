import 'package:employer_app/app/modules/auth/sign_up/api/signup_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../utils/const_values.dart';
import '../models/signup_model.dart';

class SignUpController extends GetxController {
  RxBool passwordVisibility = true.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  void onSignUpclicked() {
    if (formKey.currentState!.validate()) {
      callSignUpApi();
    }
  }

  String? employerId;

  void callSignUpApi() async {
    SignUpModel? response = await SignUpApi().postData(
      nameController.text,
      emailController.text,
      passwordController.text,
      userType,
    );
    employerId = response!.id;
  }
}
