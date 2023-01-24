import 'package:employer_app/app/modules/profile/api/profile_api.dart';
import 'package:employer_app/app/modules/profile/model/my_profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    callApi();
    assigningvalues();
    super.onInit();
  }

  RxInt? totalHires = 0.obs;
  RxInt? totalSpends = 0.obs;
  RxString name = ''.obs;
  RxString email = ''.obs;

  //Profile text controllers.
  Rx<TextEditingController>? nameController = TextEditingController().obs;
  Rx<TextEditingController>? emailController = TextEditingController().obs;
  Rx<TextEditingController>? oldPasswordController =
      TextEditingController().obs;
  Rx<TextEditingController>? newPasswordController =
      TextEditingController().obs;

  RxBool passwordVisibility = true.obs;

  void onProfileSaveButtonClicked(String name) async {
    ProfileApi().editProfileData(name: name);
    Get.back();
  }

  final formkey = GlobalKey<FormState>();

  //Getting profile details while loading screen
  void callApi() async {
    MyProfileModel? response = await ProfileApi().getProfileData();

    //If the response and its instances are  not null then assigning values to the variables.
    if (response != null) {
      if (response.totalSpend != null) {
        totalSpends!.value = response.totalSpend!;
      }
      if (response.hires != null) {
        totalHires!.value = response.hires!;
      }
      //checking the owner and its instances are  not null and assigning the values to the variables.
      if (response.owner != null) {
        if (response.owner!.name != null) {
          name.value = response.owner!.name!;
        }
        if (response.owner!.email != null) {
          email.value = response.owner!.email!;
        }
      }
    }
  }

//assigning values to the textfeild.
  void assigningvalues() {
    nameController?.value.text = name.value;
    emailController?.value.text = email.value;
  }

  //change password function.
  void changePassword() {
    if (formkey.currentState!.validate()) {
      ProfileApi().editProfileData(
        oldPassword: oldPasswordController!.value.text,
        newPassword: newPasswordController!.value.text,
        successMessage: "Password Changed succssfully",
      );
      onChangepasswordBottomSheetClose();
    }
  }

  //Values will be cleared when changepassword bottomsheet closed is closed.
  void onChangepasswordBottomSheetClose() {
    oldPasswordController?.value.clear();
    newPasswordController?.value.clear();
    Get.back();
  }
}
