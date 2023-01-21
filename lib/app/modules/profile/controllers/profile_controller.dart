import 'package:employer_app/app/modules/profile/api/profile_api.dart';
import 'package:employer_app/app/modules/profile/model/my_profile_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    callApi();
    super.onInit();
  }

  int? totalHires;
  int? totalSpends;

  void callApi() async {
    MyProfileModel? response = await ProfileApi().getProfileData();

    if (response != null) {
      if (response.totalSpend != null) {
        totalSpends = response.totalSpend;
      }
      if (response.hires != null) {
        totalHires = response.hires;
      }
    }
  }
}
