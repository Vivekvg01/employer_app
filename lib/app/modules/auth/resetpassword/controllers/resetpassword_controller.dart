import 'dart:convert';
import 'dart:developer';
import 'package:employer_app/app/modules/auth/forgetpassword/controllers/forgetpassword_controller.dart';
import 'package:employer_app/app/utils/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ResetpasswordController extends GetxController {
  TextEditingController otpController = TextEditingController();
  TextEditingController newPassController = TextEditingController();

  final GlobalKey<FormState> resetPassFromKey = GlobalKey<FormState>();

  ForgetpasswordController forgetpasswordController =
      Get.put(ForgetpasswordController());

  void onButtonClicked() {
    if (resetPassFromKey.currentState!.validate()) {
      postData(
        otpController.text,
        forgetpasswordController.emailController.text,
        newPassController.text,
      );
    }
  }
}

void postData(String otp, String email, String password) async {
  var headers = {'Content-Type': 'application/json'};
  try {
    Map<String, dynamic> requestBody = {
      "email": email,
      "otp": otp,
      "password": password,
    };

    final url = Uri.parse('${ApiEndPoints().kBaseUrl}/forgotPasswordVerify');
    http.Response response = await http.patch(
      url,
      body: jsonEncode(requestBody),
      headers: headers,
    );
    
    if (response.body == '"success"') {
      Get.showSnackbar(
        const GetSnackBar(
          message: "Password changed",
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
          snackStyle: SnackStyle.FLOATING,
        ),
      );
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          message: "Wrong Otp",
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
          snackStyle: SnackStyle.FLOATING,
        ),
      );
    }
  } catch (e) {
    log(e.toString());
  }
  return null;
}
