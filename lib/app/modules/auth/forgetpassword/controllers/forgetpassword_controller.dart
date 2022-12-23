import 'dart:convert';
import 'dart:developer';
import 'package:employer_app/app/modules/auth/resetpassword/views/resetpassword_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ForgetpasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void onSendOtpButtonCLick() {
    postData(
      emailController.text,
    );
  }

  Future<dynamic> postData(String email) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      Map<String, dynamic> requestBody = {
        "email": email,
      };
      final url = Uri.parse('http://10.0.2.2:3001/api/forgotPassword');
      http.Response response = await http.patch(
        url,
        body: jsonEncode(requestBody),
        headers: headers,
      );
      var respBody = response.body;
      if (respBody == '"Success"') {
        print('otp send');
        Get.to(ResetpasswordView());
        return respBody;
      } else {
        print('failed');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
