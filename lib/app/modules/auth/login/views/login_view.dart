import 'package:employer_app/app/common_widgets/auth_pass_textfeild.dart';
import 'package:employer_app/app/common_widgets/auth_textfeild.dart';
import 'package:employer_app/app/common_widgets/rect_button.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';
import '../../forgetpassword/views/forgetpassword_view.dart';
import '../../sign_up/views/sign_up_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView {
  LoginView({super.key});

  final loginController = Get.put(LoginController());

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
                key: loginController.loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login to',
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
                      hintText: 'Email',
                      validateText: "Email can't be empty",
                      emailvalidationMessage: "Enter a valid email",
                      authTextController: loginController.emailController,
                      icon: Icons.person_outline,
                    ),
                    sizedheight(size.height * 0.02),
                    Obx(
                      () => AuthPassTextFeild(
                        passwordVisibility:
                            loginController.passwordVisibility.value,
                        authTextController: loginController.passwordController,
                        suffixOnTap: () {
                          loginController.passwordVisibility.value =
                              !loginController.passwordVisibility.value;
                        },
                      ),
                    ),
                    sizedheight(size.height * 0.01),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          Get.to(ForgetpasswordView());
                        },
                        child: const Text(
                          'Forget passoword?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 44, 33, 243),
                          ),
                        ),
                      ),
                    ),
                    sizedheight(size.height * 0.01),
                    SizedBox(
                      width: double.infinity,
                      height: size.height * 0.06,
                      child: CustomRectButton(
                        buttonLabel: 'Login',
                        onButtonClicked: () {
                          loginController.onLoginButtonCliked();
                        },
                      ),
                    ),
                    sizedheight(size.height * 0.02),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Dont't have an account?  ",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                          children: [
                            TextSpan(
                              text: "Sign up",
                              style: const TextStyle(
                                color: Color.fromARGB(255, 44, 33, 243),
                                fontSize: 15,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(() => SignUpView()),
                            ),
                          ],
                        ),
                      ),
                    )
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
