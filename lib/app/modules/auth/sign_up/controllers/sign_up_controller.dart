import 'package:employer_app/app/common_widgets/loader_over_screen.dart';
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

  final signUpFormKey = GlobalKey<FormState>();
  void onSignUpclicked() {
    if (signUpFormKey.currentState!.validate()) {
      callSignUpApi();
    }
  }

  String? employerId;

  void callSignUpApi() async {
    ShowLoaderOverScreen.showLoader();
    SignUpModel? response = await SignUpApi().postData(
      nameController.text,
      emailController.text,
      passwordController.text,
      userType,
    );
    if (response != null) {
      employerId = response.id;
    }
    ShowLoaderOverScreen.stopLoader();
  }
}
