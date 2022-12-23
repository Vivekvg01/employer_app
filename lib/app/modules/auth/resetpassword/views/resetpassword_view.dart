import 'package:employer_app/app/utils/app_colors.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../sign_up/views/sign_up_view.dart';
import '../controllers/resetpassword_controller.dart';

class ResetpasswordView extends GetView {
  ResetpasswordView({Key? key}) : super(key: key);

  final resetPasswordController = Get.put(ResetpasswordController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Reset Password?',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sizedheight(size.height * 0.05),
                TextField(
                  controller: resetPasswordController.otpController,
                  decoration: const InputDecoration(
                    hintText: 'Enter OTP',
                  ),
                ),
                sizedheight(size.height * 0.02),
                TextField(
                  controller: resetPasswordController.newPassController,
                  decoration: const InputDecoration(
                    hintText: 'Enter new password',
                  ),
                ),
                sizedheight(size.height * 0.05),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      resetPasswordController.onButtonClicked();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      minimumSize: const Size(350, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Verify and Update'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Don't have an account?"),
          TextButton(
            onPressed: () {
              Get.to(SignUpView());
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: klightblueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
