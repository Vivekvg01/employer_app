import 'package:employer_app/app/modules/profile/api/profile_api.dart';
import 'package:employer_app/app/modules/profile/model/my_prof_compled_jobs.dart';
import 'package:employer_app/app/modules/profile/model/my_prof_owner.dart';
import 'package:employer_app/app/modules/profile/model/my_profile_model.dart';
import 'package:employer_app/app/modules/recharge/controllers/recharge_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../auth/login/controllers/login_controller.dart';
import '../../auth/login/views/login_view.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    getProfileDatas();
    assigningvalues();
    super.onInit();
  }

  int totalHires = 0;
  int totalSpends = 0;
  String name = '';
  String email = '';

  RxBool isLoading = false.obs;

  final loginController = Get.put(
      LoginController()); //initializing login controller for logout function

  //logout funcion clears the token
  Future<void> signOut() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
    loginController.setIsLoggedIn(false);
    Get.offAll(() => LoginView());
  }

  //Profile text controllers.
  TextEditingController nameController = TextEditingController();
  Rx<TextEditingController>? emailController = TextEditingController().obs;
  Rx<TextEditingController>? oldPasswordController =
      TextEditingController().obs;
  Rx<TextEditingController>? newPasswordController =
      TextEditingController().obs;

  RxList<CompletedJob> completedJobList = <CompletedJob>[].obs;
  var savedJobs = [].obs;

  RxBool passwordVisibility = true.obs;

  void onProfileSaveButtonClicked(String name) async {
    Owner? response = await ProfileApi().editProfileData(name: name);
    if (response?.name != null) {
      nameController.text = response!.name!;
      update();
      Get.back();
    }
  }

  final formkey = GlobalKey<FormState>();

  //Getting profile details while loading screen
  void getProfileDatas() async {
    isLoading(true);
    MyProfileModel? response = await ProfileApi().getProfileData();
    //If the response and its instances are  not null then assigning values to the variables.
    if (response != null) {
      if (response.totalSpend != null) {
        totalSpends = response.totalSpend!;
      }
      if (response.hires != null) {
        totalHires = response.hires!;
      }
      //checking the owner and its instances are  not null and assigning ths to the variables.
      if (response.owner != null) {
        if (response.owner!.name != null) {
          name = response.owner!.name!;
        }
        if (response.owner!.email != null) {
          email = response.owner!.email!;
        }
      }
      if (response.completedJobs != null) {
        completedJobList.value = response.completedJobs!;
      }
      if (response.savedTalents != null) {
        savedJobs.value = response.savedTalents!;
      }
      if (response.balance != null) {
        Get.find<RechargeController>().totalBalance.value = response.balance!;
      }
      update();
    }

    isLoading(false);
  }

//assigning values to the textfeild.
  void assigningvalues() {
    nameController.text = name;
    emailController?.value.text = email;
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

  //values will be cleared when changepassword bottomsheet closed is closed.
  void onChangepasswordBottomSheetClose() {
    oldPasswordController?.value.clear();
    newPasswordController?.value.clear();
    Get.back();
  }
}
