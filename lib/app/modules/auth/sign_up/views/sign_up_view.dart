import 'package:employer_app/app/common_widgets/auth_pass_textfeild.dart';
import 'package:employer_app/app/common_widgets/auth_textfeild.dart';
import 'package:employer_app/app/common_widgets/rect_button.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';
import '../../login/views/login_view.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  final SignUpController _signUpController = Get.put(SignUpController());

  SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: controller.signUpFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sign up to',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'GET WORKER',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    sizedheight(size.height * 0.05),
                    AuthTextFeild(
                      hintText: 'Username',
                      validateText: "Username can't be empty",
                      authTextController: _signUpController.nameController,
                      icon: Icons.person_outline,
                    ),
                    sizedheight(size.height * 0.02),
                    AuthTextFeild(
                      hintText: 'Email',
                      validateText: "Email can't be empty",
                      emailvalidationMessage: "Enter a valid email",
                      authTextController: _signUpController.emailController,
                      icon: Icons.email_outlined,
                    ),
                    sizedheight(size.height * 0.02),
                    Obx(
                      () => AuthPassTextFeild(
                        passwordVisibility:
                            _signUpController.passwordVisibility.value,
                        authTextController:
                            _signUpController.passwordController,
                        suffixOnTap: () {
                          _signUpController.passwordVisibility.value =
                              !_signUpController.passwordVisibility.value;
                        },
                      ),
                    ),
                    sizedheight(size.height * 0.02),
                    Obx(
                      () => AuthPassTextFeild(
                        passwordVisibility:
                            _signUpController.passwordVisibility.value,
                        authTextController:
                            _signUpController.cPasswordController,
                        suffixOnTap: () {
                          _signUpController.passwordVisibility.value =
                              !_signUpController.passwordVisibility.value;
                        },
                        hintText: "Confirm Password",
                      ),
                    ),
                    sizedheight(size.height * 0.04),
                    SizedBox(
                      width: double.infinity,
                      height: size.height * 0.06,
                      child: CustomRectButton(
                        buttonLabel: 'Sign Up',
                        onButtonClicked: () {
                          _signUpController.onSignUpclicked();
                        },
                      ),
                    ),
                    sizedheight(size.height * 0.02),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account?  ",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                          children: [
                            TextSpan(
                              text: "Login",
                              style: const TextStyle(
                                color: Color.fromARGB(255, 44, 33, 243),
                                fontSize: 15,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.back(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
