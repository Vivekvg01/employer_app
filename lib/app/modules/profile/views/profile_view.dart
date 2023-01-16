import 'package:employer_app/app/utils/app_colors.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.kDarkGreen,
        title: const Text('My Profile'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            sizedheight(size.height * 0.02),
            CircleAvatar(
              radius: 48,
              child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                fit: BoxFit.cover,
              ),
            ),
            sizedheight(size.height * 0.03),
            Row(
              children: [
                Container(
                  height: size.height * 0.1,
                  width: size.width * 0.4,
                  color: AppColors.kDarkGreen,
                  child: Center(
                    child: Text(
                      'Total Hires',
                      style: TextStyle(
                        color: AppColors.kWhiteColor,
                      ),
                    ),
                  ),
                ),
                sizedWidth(size.width * 0.08),
                Container(
                  height: size.height * 0.1,
                  width: size.width * 0.4,
                  decoration: BoxDecoration(
                    color: AppColors.kDarkGreen,
                  ),
                  child: Center(
                    child: Text(
                      'Total Spends',
                      style: TextStyle(
                        color: AppColors.kWhiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            sizedheight(size.height * 0.02),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'Name',
              ),
            ),
            sizedheight(size.height * 0.02),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            sizedheight(size.height * 0.05),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
