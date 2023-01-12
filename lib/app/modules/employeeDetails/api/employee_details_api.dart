import 'dart:convert';
import 'dart:developer';
import 'package:employer_app/app/modules/employeeDetails/models/employee_details_api.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../../utils/api_endpoints.dart';
import 'package:http/http.dart' as http;

class EmployeeDetailsApi {
  Future<GetEmployeeDetails?> getAllEmpolyee(String employeeId) async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');

    final url = Uri.parse(
      '${ApiEndPoints().kBaseUrl}/employee/profile/$employeeId',
    );

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        GetEmployeeDetails respModel = GetEmployeeDetails.fromJson(data);
        return respModel;
      } else if (response.statusCode == 404) {
        final data = json.decode(response.body);
        final errorMessage = data['message'];
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
