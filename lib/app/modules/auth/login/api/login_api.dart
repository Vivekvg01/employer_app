import 'dart:convert';
import 'dart:developer';
import 'package:employer_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:employer_app/app/modules/dashboard/views/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/login_model.dart';

class LoginApi {
  Future<LoginModel?> postData(String email, String password) async {
    Get.lazyPut<DashboardController>(() => DashboardController());

    dynamic statusCode;
    var headers = {'Content-Type': 'application/json'};
    try {
      Map<String, dynamic> requestBody = {
        "email": email,
        "password": password,
      };

      final url = Uri.parse('http://10.0.2.2:3001/api/login');
      http.Response response = await http.post(
        url,
        body: jsonEncode(requestBody),
        headers: headers,
      );
      statusCode = response.statusCode;
      if (statusCode == 200) {
        //request success
        print('Login succesfull');
        final json = jsonDecode(response.body);
        Get.showSnackbar(
          const GetSnackBar(
            message: "Login successfull",
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
            snackStyle: SnackStyle.FLOATING,
          ),
        );
        Get.offAll(const DashboardView());
        LoginModel respModel = LoginModel.fromJson(json);
        return respModel;
      } else if (statusCode == 404) {
        //error message
        Get.showSnackbar(
          const GetSnackBar(
            message: "Username and password does not match",
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
            snackStyle: SnackStyle.FLOATING,
          ),
        );
      } else {
        log(response.body.toString()); 
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
