import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../api/login_api.dart';
import '../model/login_model.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final isLoggedIn = false.obs;

  String? tokenId;
  String? employerId;

  RxBool passwordVisibility = true.obs;

  final loginFormKey = GlobalKey<FormState>();

  void onLoginButtonCliked() {
    if (loginFormKey.currentState!.validate()) {
      callLoginApi();
    }
  }

  Future<void> callLoginApi() async {
    await Future.delayed(const Duration(seconds: 2));
    LoginModel? response = await LoginApi()
        .postData(emailController.text, passwordController.text);
    if (response != null) {
      tokenId = response.token;
      employerId = response.id;
    }

    tokenSaving();
  }

  void setIsLoggedIn(bool value) {
    isLoggedIn.value = value;
  }

  Future<void> tokenSaving() async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'token', value: tokenId);
    await storage.write(key: 'employerId', value: employerId);
    setIsLoggedIn(true);
  }
}
