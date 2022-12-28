import 'dart:convert';
import 'dart:developer';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../otp/views/otp_view.dart';
import '../models/signup_model.dart';

class SignUpApi {
  dynamic statusCode;

  Future<SignUpModel?> postData(
    String name,
    String email,
    String password,
    String userType,
  ) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      Map<String, dynamic> requestBody = {
        "name": name,
        "email": email,
        "password": password,
        "userType": userType,
      };

      final url = Uri.parse('http://10.0.2.2:3001/api/register');

      final respone = await http.post(
        url,
        body: jsonEncode(requestBody),
        headers: headers,
      );
      statusCode = respone.statusCode;
      if (statusCode == 200) {
        //success response
        final json = jsonDecode(respone.body);
        SignUpModel respModel = SignUpModel.fromJson(json);
        print(respModel.id);
        Get.to(OtpView());
        print(respModel.id);
        return respModel;
      } else if (statusCode == 404) {
        //email already been used
        GetSnackBar(
          message: "Email already in use",
          backgroundColor: primaryColor,
          duration: const Duration(seconds: 3),
          snackStyle: SnackStyle.FLOATING,
        );
      } else {
        print('error occured');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
