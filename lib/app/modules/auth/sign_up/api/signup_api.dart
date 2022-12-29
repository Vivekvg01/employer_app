import 'dart:convert';
import 'dart:developer';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../otp/views/otp_view.dart';
import '../models/signup_model.dart';

class SignUpApi {
  Future<SignUpModel?> postData(
    String name,
    String email,
    String password,
    String userType,
  ) async {
    dynamic statusCode;
    var headers = {'Content-Type': 'application/json'};
    try {
      Map<String, dynamic> requestBody = {
        "name": name,
        "email": email,
        "password": password,
        "userType": userType
      };
      final url = Uri.parse('http://10.0.2.2:3001/api/register');
      http.Response response = await http.post(
        url,
        body: jsonEncode(requestBody),
        headers: headers,
      );
      statusCode = response.statusCode;
      if (statusCode == 200) {
        //success response
        final json = jsonDecode(response.body);
        SignUpModel respModel = SignUpModel.fromJson(json);

        Get.to(OtpView());

        return respModel;
      } else if (statusCode == 404) {
        //email already been used
        Get.showSnackbar(
          GetSnackBar(
            message: "Email already in use",
            backgroundColor: kredColor,
            duration: const Duration(seconds: 3),
            snackStyle: SnackStyle.FLOATING,
          ),
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
