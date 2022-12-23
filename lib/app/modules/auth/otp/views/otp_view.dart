import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  final _otpController = Get.put(OtpController());

  OtpView({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
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
                  'Verify OTP',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sizedheight(size.height * 0.05),
                TextField(
                  maxLength: 4,
                  controller: _otpController.otpTextController,
                  decoration: const InputDecoration(
                    hintText: 'Enter otp number',
                  ),
                ),
                sizedheight(size.height * 0.05),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _otpController.onSubmitButtonClicked();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      minimumSize: const Size(350, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Submit'),
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
