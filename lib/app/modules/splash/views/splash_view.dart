import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Text(
          'GET WORKER',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }
}
