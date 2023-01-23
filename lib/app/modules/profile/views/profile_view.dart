import 'package:employer_app/app/modules/profile/views/widgets/data_count_widgets.dart';
import 'package:employer_app/app/modules/profile/views/widgets/diabled_profile_view.dart';
import 'package:employer_app/app/modules/profile/views/widgets/edit_name_bottom_sheet.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:employer_app/app/utils/const_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    profileController.onInit();
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
                defaultProfileImgae,
                fit: BoxFit.contain,
              ),
            ),
            sizedheight(size.height * 0.03),
            Row(
              children: [
                DataCountWidget(
                  title: 'TOTAL HIRES',
                  count: profileController.totalHires!.value,
                ),
                sizedWidth(size.width * 0.08),
                DataCountWidget(
                  title: 'TOTAL SPENDS',
                  count: profileController.totalSpends!.value,
                ),
              ],
            ),
            sizedheight(size.height * 0.04),
            ListTile(
              onTap: () {
                Get.bottomSheet(
                  EditNameBottomSheet(
                    textFeildVal:
                        profileController.nameController?.value.text ?? '',
                  ),
                );
              },
              leading: Icon(Icons.person, color: AppColors.kDarkGreen),
              title: Text(profileController.nameController!.value.text),
              subtitle: const Padding(
                  padding: EdgeInsets.only(
                    top: 5.0,
                  ),
                  child: Text(
                    'This is not your username or pin.This name will be vibile to the employes.',
                    style: TextStyle(fontSize: 13),
                  )),
              trailing: Icon(Icons.edit, color: AppColors.kDarkGreen),
            ),
            kDivider1,
            ListTile(
              leading: Icon(
                Icons.email,
                color: AppColors.kDarkGreen,
              ),
              title: Text(profileController.emailController!.value.text),
            ),
            kDivider1,
            sizedheight(size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
