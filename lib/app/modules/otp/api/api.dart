import 'dart:convert';
import 'dart:developer';
import 'package:employer_app/app/modules/home/views/home_view.dart';
import 'package:employer_app/app/modules/otp/model/otp_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OtpApi {
  dynamic statusCode;

  Future<OtpModel?> verifyOtp(
      String userId, String otp, String userType) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      Map<String, dynamic> requestBody = {
        "userId": userId,
        "otp": otp,
        "userType": userType,
      };

      final url = Uri.parse('http://10.0.2.2:3001/api/verify-email');

      final response = await http.post(
        url,
        body: jsonEncode(requestBody),
        headers: headers,
      );
      statusCode = response.statusCode;
      print(statusCode);
      if (statusCode == 200) {
        //success response
        final json = jsonDecode(response.body);
        OtpModel respModel = OtpModel.fromJson(json);
        log(respModel.employerData!);
        Get.offAll(HomeView());
        return respModel;
      } else if (statusCode == 404) {
        log(response.body.toString());
      } else {
        print(statusCode);
        print('error occured');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
