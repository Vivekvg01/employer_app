import 'dart:convert';
import 'dart:developer';
import 'package:employer_app/app/modules/profile/model/my_prof_owner.dart';
import 'package:employer_app/app/modules/profile/model/my_profile_model.dart';
import 'package:employer_app/app/utils/api_endpoints.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../utils/app_colors.dart';

class ProfileApi {
  Future<MyProfileModel?> getProfileData() async {
    const storage = FlutterSecureStorage();

    final employerId = await storage.read(key: 'employerId');
    final token = await storage.read(key: 'token');

    final url =
        Uri.parse('${ApiEndPoints().kBaseUrl}/employer/profile/$employerId');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      http.Response respose = await http.get(
        url,
        headers: headers,
      );

      if (respose.statusCode == 200) {
        final data = jsonDecode(respose.body);
        MyProfileModel respModel = MyProfileModel.fromJson(data);
        return respModel;
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }

  Future<Owner?> editProfileData({
    String? name,
    String? password,
    String? image,
    String? oldPassword,
    String? newPassword,
    String? successMessage,
  }) async {
    const storage = FlutterSecureStorage();

    final employerId = await storage.read(key: 'employerId');
    final token = await storage.read(key: 'token');

    final url =
        Uri.parse('${ApiEndPoints().kBaseUrl}/employer/profile/$employerId');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      Map<String, dynamic> requestbody = {
        "name": name,
        "image": image,
        "oldPass": oldPassword,
        "newPass": newPassword,
      };
      http.Response response = await http.patch(
        url,
        body: jsonEncode(requestbody),
        headers: headers,
      );

      ///if it is success respnse then show snackbar if it is required,
      /// if the snackbar is not required then nothig will shows to the ui.
      if (response.statusCode == 200) {
        if (successMessage != null && successMessage.isNotEmpty) {
          Get.showSnackbar(
            GetSnackBar(
              message: successMessage,
              backgroundColor: AppColors.kGreenColor,
              duration: const Duration(seconds: 3),
              snackStyle: SnackStyle.FLOATING,
            ),
          );
        }
        final data = jsonDecode(response.body);
        return Owner.fromJson(data);
      }
      if (response.statusCode == 404) {
        //show error message from the response showed to the ui.
        final data = jsonDecode(response.body);
        final errorMessage = data['message'];
        Get.showSnackbar(
          GetSnackBar(
            message: errorMessage,
            backgroundColor: AppColors.kredColor,
            duration: const Duration(seconds: 3),
            snackStyle: SnackStyle.FLOATING,
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
