import 'package:employer_app/app/common_widgets/auth_pass_textfeild.dart';
import 'package:employer_app/app/common_widgets/auth_textfeild.dart';
import 'package:employer_app/app/common_widgets/rect_button.dart';
import 'package:employer_app/app/modules/forgetpassword/views/forgetpassword_view.dart';
import 'package:employer_app/app/modules/sign_up/views/sign_up_view.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
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
                key: loginController.formKey,
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
                      hintText: 'Username',
                      validateText: "Username can't be empty",
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
                        child: Text(
                          'Forget passoword?',
                          style: TextStyle(
                            color: klightblueColor,
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
                  ],
                ),
              ),
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
