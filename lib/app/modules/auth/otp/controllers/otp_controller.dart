import 'package:employer_app/app/modules/auth/login/controllers/login_controller.dart';
import 'package:employer_app/app/utils/const_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../sign_up/controllers/sign_up_controller.dart';
import '../api/otp_api.dart';
import '../model/otp_model.dart';

class OtpController extends GetxController {
  final TextEditingController otpTextController = TextEditingController();

  final loginController = Get.find<LoginController>();

  late SignUpController signUpController;

  String? tokenId;

  @override
  void onInit() {
    signUpController = Get.find<SignUpController>();
    super.onInit();
  }

  void onSubmitButtonClicked() {
    callOtpApi();
  }

  void callOtpApi() async {
    OtpModel? response = await OtpApi().verifyOtp(
      signUpController.employerId!,
      otpTextController.text,
      userType,
    );
    if (response != null) {
      tokenId = response.token;
    }
    tokenSaving();
  }

  Future<void> tokenSaving() async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'token', value: tokenId);
    loginController.setIsLoggedIn(true);
  }
}
