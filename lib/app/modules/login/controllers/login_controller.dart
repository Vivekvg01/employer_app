import 'dart:developer';

import 'package:employer_app/app/modules/home/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../model/login_model.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool passwordVisibility = true.obs;
  dynamic statusCode;

  final formKey = GlobalKey<FormState>();

  void onLoginButtonCliked() {
    print('-------Login button clicked------');
    if (formKey.currentState!.validate()) {
      postData(
        emailController.text,
        passwordController.text,
      );
    }
  }

  Future<LoginModel?> postData(String email, String password) async {
    try {
      LoginModel loginModel = LoginModel(
        email: email,
        password: password,
      );
      final request = await http.post(
        Uri.parse('http://10.0.2.2:3001/api/login'),
        body: loginModel.toJson(),
      );
      statusCode = request.statusCode;
      if (statusCode == 200) {
        //request success
        print('Login succesfull');
        log(request.body.toString());
        Get.offAll(const HomeView());
      } else if (statusCode == 404) {
        //error message
        print('Error response');
        log(request.body.toString());
      } else {
        print(statusCode);

        log(request.body.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
