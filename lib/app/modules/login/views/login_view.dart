import 'package:employer_app/app/modules/forgetpassword/views/forgetpassword_view.dart';
import 'package:employer_app/app/modules/sign_up/views/sign_up_view.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  // const LoginView({super.key});

  final _loginController = Get.put(LoginController());

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
                key: controller.formKey,
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
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email can't be empty";
                          }
                          return null;
                        },
                        controller: controller.emailController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          hintText: 'Email ID',
                        ),
                      ),
                    ),
                    sizedheight(size.height * 0.02),
                    Obx(
                      () => SizedBox(
                        height: 50,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password can't be empty";
                            }
                            return null;
                          },
                          obscureText: controller.passwordVisibility.value,
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outlined),
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.passwordVisibility.value =
                                    !controller.passwordVisibility.value;
                              },
                              icon: Icon(
                                controller.passwordVisibility.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
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
                    ElevatedButton(
                      onPressed: () {
                        controller.onLoginButtonCliked();
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        minimumSize: const Size(350, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text('Login'),
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
