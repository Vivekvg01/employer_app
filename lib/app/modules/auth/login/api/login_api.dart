import 'dart:convert';
import 'dart:developer';
import 'package:employer_app/app/common_widgets/loader_over_screen.dart';
import 'package:employer_app/app/modules/dashboard/views/dashboard_view.dart';
import 'package:employer_app/app/utils/api_endpoints.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../dashboard/controllers/dashboard_controller.dart';
import '../model/login_model.dart';

class LoginApi {
  Future<LoginModel?> postData(String email, String password) async {
    Get.lazyPut<DashboardController>(() => DashboardController());
    ShowLoaderOverScreen.showLoader();

    var headers = {'Content-Type': 'application/json'};
    try {
      Map<String, dynamic> requestBody = {
        "email": email,
        "password": password,
      };

      final url = Uri.parse("${ApiEndPoints().kBaseUrl}/login");
      http.Response response = await http.post(
        url,
        body: jsonEncode(requestBody),
        headers: headers,
      );
      if (response.statusCode == 200) {
        //request success
        final data = jsonDecode(response.body);
        Get.showSnackbar(
          const GetSnackBar(
            message: "Login successfull",
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
            snackStyle: SnackStyle.FLOATING,
          ),
        );
        Get.offAll(() => const DashboardView());
        LoginModel respModel = LoginModel.fromJson(data);
        ShowLoaderOverScreen.stopLoader();
        return respModel;
      } else if (response.statusCode == 404) {
        final data = jsonDecode(response.body);
        final errorMessage = data['message'];
        ShowLoaderOverScreen.stopLoader();
        Get.showSnackbar(
          GetSnackBar(
            message: errorMessage,
            backgroundColor: AppColors.kredColor,
            duration: const Duration(seconds: 3),
            snackStyle: SnackStyle.FLOATING,
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
