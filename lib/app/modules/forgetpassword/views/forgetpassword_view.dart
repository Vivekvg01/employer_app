import 'package:employer_app/app/modules/resetpassword/views/resetpassword_view.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgetpassword_controller.dart';

class ForgetpasswordView extends GetView<ForgetpasswordController> {
  ForgetpasswordView({Key? key}) : super(key: key);

  final forgetPassController = Get.put(ForgetpasswordController());

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
                  obscureText: true,
                  controller: controller.emailController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                  ),
                ),
                sizedheight(size.height * 0.05),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(const ResetpasswordView());
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      minimumSize: const Size(350, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Send Otp'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
