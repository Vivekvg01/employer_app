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

  int? totalHires;
  int? totalSpends;
  String? name;
  String? email;

  TextEditingController? nameController = TextEditingController();
  TextEditingController? emailController = TextEditingController();

  void callApi() async {
    MyProfileModel? response = await ProfileApi().getProfileData();

    //If the response and its instances are  not null then assigning values to the variables.
    if (response != null) {
      if (response.totalSpend != null) {
        totalSpends = response.totalSpend;
      }
      if (response.hires != null) {
        totalHires = response.hires;
      }
      //checking the owner and its instances are  not null and assigning the values to the variables.
      if (response.owner != null) {
        if (response.owner!.name != null) {
          name = response.owner!.name;
        } else {
          //if value is null assign it as an empty string
          name = '';
        }
        if (response.owner!.email != null) {
          email = response.owner!.email;
        } else {
          //if value is null assign it as an empty string
          email = '';
        }
      }
    }
  }

  void assigningvalues() {
    nameController?.text = name ?? '';
    emailController?.text = email ?? '';
  }
}
