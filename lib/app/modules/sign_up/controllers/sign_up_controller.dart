import 'dart:developer';
import 'package:employer_app/app/modules/sign_up/models/signup_model.dart';
import 'package:employer_app/app/modules/otp/views/otp_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  RxBool passwordVisibility = true.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();

  dynamic statusCode;

  final formKey = GlobalKey<FormState>();

  void onSignUpclicked() {
    if (formKey.currentState!.validate()) {
      postData(
        nameController.text,
        emailController.text,
        passwordController.text,
        "employer",
      );
    }
  }

  Future<SignUpModel?> postData(
    String name,
    String email,
    String password,
    String userType,
  ) async {
    try {
      SignUpModel signUpModel = SignUpModel(
        name: name,
        email: email,
        password: password,
        userType: userType,
      );
      final request = await http.post(
        Uri.parse('http://10.0.2.2:3001/api/register'),
        body: signUpModel.toJson(),
      );
      statusCode = request.statusCode;
      if (statusCode == 200) {
        //success response
        print('user created successully');
        log(request.body.toString());
        Get.to(OtpView());
      } else if (statusCode == 404) {
        //email already been used
        log(request.body.toString());
      } else {
        log(request.body.toString());
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
