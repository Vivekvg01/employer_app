import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
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
                key: controller.formKey,
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
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username can't be empty";
                        }
                        return null;
                      },
                      controller: _signUpController.nameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_outline),
                        hintText: 'Username',
                      ),
                    ),
                    sizedheight(size.height * 0.02),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username can't be empty";
                        }
                        return null;
                      },
                      controller: _signUpController.emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: 'Email ID',
                      ),
                    ),
                    sizedheight(size.height * 0.02),
                    Obx(
                      () => TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Username can't be empty";
                          }
                          return null;
                        },
                        controller: _signUpController.passwordController,
                        obscureText: _signUpController.passwordVisibility.value,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              _signUpController.passwordVisibility.value =
                                  !_signUpController.passwordVisibility.value;
                            },
                            icon: Icon(
                              _signUpController.passwordVisibility.value == true
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          prefixIcon: const Icon(Icons.lock_outlined),
                          hintText: 'Password',
                        ),
                      ),
                    ),
                    sizedheight(size.height * 0.02),
                    Obx(
                      () => TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Username can't be empty";
                          }
                          return null;
                        },
                        controller: _signUpController.cPasswordController,
                        obscureText: _signUpController.passwordVisibility.value,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outlined),
                          suffixIcon: IconButton(
                            onPressed: () {
                              _signUpController.passwordVisibility.value =
                                  !_signUpController.passwordVisibility.value;
                            },
                            icon: Icon(
                              _signUpController.passwordVisibility.value == true
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          hintText: 'Confirm Password',
                        ),
                      ),
                    ),
                    sizedheight(size.height * 0.01),
                    sizedheight(size.height * 0.04),
                    ElevatedButton(
                      onPressed: () {
                        // Get.to(HomeView());
                        controller.onSignUpclicked();
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        minimumSize: const Size(350, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text('Sign Up'),
                    ),
                    // SizedBox(height: size.height * 0.02),
                    // Row(
                    //   children: const [
                    //     Expanded(
                    //       child: Divider(thickness: 1.5),
                    //     ),
                    //     Text(
                    //       "OR",
                    //       style: TextStyle(fontSize: 16, color: Colors.grey),
                    //     ),
                    //     Expanded(
                    //       child: Divider(thickness: 1.5),
                    //     ),
                    //   ],
                    // ),
                    // sizedheight(size.height * 0.02),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Get.to(const HomeView());
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.transparent,
                    //     elevation: 0.0,
                    //     minimumSize: const Size(350, 48),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(8.0),
                    //       side: const BorderSide(color: Colors.black),
                    //     ),
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Image.asset(
                    //         'assets/pngegg.png',
                    //         height: 30,
                    //         width: 30,
                    //       ),
                    //       const Text(
                    //         'Sign up with google',
                    //         style: TextStyle(
                    //           color: Colors.black,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: () {
                            //Get.to(LoginView());
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: klightblueColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     const Text("Already have an account?"),
      //     TextButton(
      //       onPressed: () {
      //         Get.to(LoginView());
      //       },
      //       child: Text(
      //         'Login',
      //         style: TextStyle(
      //           color: klightblueColor,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
