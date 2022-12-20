import 'dart:developer';
import 'package:employer_app/app/modules/home/views/home_view.dart';
import 'package:employer_app/app/modules/otp/model/otp_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class OtpController extends GetxController {
  final TextEditingController otpTextController = TextEditingController();

  void onSubmitButtonClicked() {
    verifyOtp(
      "639c31a990d6292bf5a1e333",
      otpTextController.text,
      "employer",
    );
  }

  dynamic statusCode;

  Future<OtpModel?> verifyOtp(
      String userId, String otp, String userType) async {
    try {
      OtpModel otpModel = OtpModel( 
        userId: userId,
        otp: otp, 
        userType: userType,
      ); 
      final request = await http.post(
        Uri.parse('http://10.0.2.2:3001/api/verify-email'),
        body: otpModel.toJson(),
      );
      statusCode = request.statusCode;
      if (statusCode == 200) {
        //success response
        print(statusCode);
        print('OTP VERIFIED');
        Get.offAll(const HomeView());
        log(request.body.toString());
      } else if (statusCode == 404) {
        print(statusCode);
        log(request.body.toString()); 
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
