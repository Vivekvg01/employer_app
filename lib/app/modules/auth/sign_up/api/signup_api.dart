import 'dart:convert';
import 'dart:developer';
import 'package:employer_app/app/utils/api_endpoints.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../common_widgets/loader_over_screen.dart';
import '../../otp/views/otp_view.dart';
import '../models/signup_model.dart';

class SignUpApi {
  Future<SignUpModel?> postData(
    String name,
    String email,
    String password,
    String userType,
  ) async {
    ShowLoaderOverScreen.showLoader();
    var headers = {'Content-Type': 'application/json'};
    try {
      Map<String, dynamic> requestBody = {
        "name": name,
        "email": email,
        "password": password,
        "userType": userType
      };
      final url = Uri.parse('${ApiEndPoints().kBaseUrl}/register');
      http.Response response = await http.post(
        url,
        body: jsonEncode(requestBody),
        headers: headers,
      );
      log(response.body);

      if (response.statusCode == 200) {
        //success response
        final json = jsonDecode(response.body);
        Get.off(() => OtpView());
        SignUpModel respModel = SignUpModel.fromJson(json);
        ShowLoaderOverScreen.stopLoader();
        return respModel;
      } else if (response.statusCode == 404) {
        //error response
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
        ShowLoaderOverScreen.stopLoader();
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
