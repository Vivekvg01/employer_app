import 'dart:convert';
import 'dart:developer';
import 'package:employer_app/app/modules/profile/model/my_profile_model.dart';
import 'package:employer_app/app/utils/api_endpoints.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

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

  void editProfileData({
    String? name,
    String? password,
    String? image,
    String? oldPassword,
    String? newPassword,
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
      log(response.body);
    } catch (e) {
      log(e.toString());
    }
  }
}
