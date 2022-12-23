import 'dart:convert';
import 'dart:developer';
import 'package:employer_app/app/modules/home/views/home_view.dart';
import 'package:employer_app/app/modules/login/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  Future<LoginModel?> postData(String email, String password) async {
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
        Get.offAll(HomeView());
        LoginModel respModel = LoginModel.fromJson(json);
        return respModel;
      } else if (statusCode == 404) {
        //error message
        print('Error response');
        Get.showSnackbar(
          const GetSnackBar(
            message: "Username and password does not match",
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
            snackStyle: SnackStyle.FLOATING,
          ),
        );
      } else {
        print(statusCode);
        log(response.body.toString());
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
