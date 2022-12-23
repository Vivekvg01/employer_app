import 'package:employer_app/app/modules/login/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../api/login_api.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final isLoggedIn = false.obs;

  String? tokenId;

  RxBool passwordVisibility = true.obs;

  final formKey = GlobalKey<FormState>();

  void onLoginButtonCliked() {
    if (formKey.currentState!.validate()) {
      callLoginApi();
    }
  }

  Future<void> callLoginApi() async {
    LoginModel? response = await LoginApi()
        .postData(emailController.text, passwordController.text);
    if (response != null) {
      tokenId = response.token;
    }
    tokenSaving();
  }

  void setIsLoggedIn(bool value) {
    isLoggedIn.value = value;
  }

  Future<void> tokenSaving() async {
    final storage = FlutterSecureStorage();
    await storage.write(key: 'token', value: tokenId);
    setIsLoggedIn(true);
  }
}
