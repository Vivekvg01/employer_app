import 'dart:convert';
import 'dart:developer';
import 'package:employer_app/app/modules/auth/otp/model/otp_model.dart';
import 'package:employer_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:employer_app/app/modules/dashboard/views/dashboard_view.dart';
import 'package:employer_app/app/utils/api_endpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OtpApi {
  Future<OtpModel?> verifyOtp(
      String userId, String otp, String userType) async {
    Get.lazyPut<DashboardController>(() => DashboardController());
    var headers = {'Content-Type': 'application/json'};
    try {
      Map<String, dynamic> requestBody = {
        "userId": userId,
        "otp": otp,
        "userType": userType,
      };

      final url = Uri.parse('${ApiEndPoints().kBaseUrl}/verify-email');

      final response = await http.post(
        url,
        body: jsonEncode(requestBody),
        headers: headers,
      );

      if (response.statusCode == 200) {
        //success response
        final json = jsonDecode(response.body);
        OtpModel respModel = OtpModel.fromJson(json);

        Get.offAll(() => const DashboardView());

        return respModel;
      } else if (response.statusCode == 404) {
        log(response.body.toString());
      } else {
        log(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
