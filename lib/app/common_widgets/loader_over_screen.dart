import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';

//spinkit loder displayed over ui
class ShowLoaderOverScreen {
  static showLoader() {
    Get.dialog(
      Center(
        child: SpinKitChasingDots(
          color: AppColors.kGreenColor,
        ),
      ),
    );
  }

  static void stopLoader() {
    if (Get.isDialogOpen!) Get.back();
  }
}
