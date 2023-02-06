import 'dart:convert';
import 'dart:developer';
import 'package:employer_app/app/modules/recharge/models/purchase_history_model.dart';
import 'package:employer_app/app/utils/const_values.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../utils/api_endpoints.dart';
import '../../../utils/app_colors.dart';

class RechargeApi {
  //get purchase history api.
  Future<PurchaseHistoryModel?> getPurchaseHistory() async {
    const storage = FlutterSecureStorage();

    final employerId = await storage.read(key: 'employerId');
    final token = await storage.read(key: 'token');
    final url =
        Uri.parse('${ApiEndPoints().kBaseUrl}/credit/history/$employerId');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        PurchaseHistoryModel respModel = PurchaseHistoryModel.fromJson(data);
        return respModel;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  //verify payment api calling.
  void verifyPayment({
    required String orderid,
    required String paymentId,
    required String signature,
    required String amount,
  }) async {
    Map<String, dynamic> reqBody = {
      'razorpay_order_id': orderid,
      'razorpay_payment_id': paymentId,
      'razorpay_signature': signature,
    };

    const storage = FlutterSecureStorage();
    final employerId = await storage.read(key: 'employerId');

    final url = Uri.parse(
      '${ApiEndPoints().kBaseUrl}/credit/paymentVerification?userId=$employerId&amount=$amount&user=$userType',
    );

    final token = await storage.read(key: 'token');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(reqBody),
      );
      log(response.body);
      if (response.statusCode == 302) {
       Get.showSnackbar(
          GetSnackBar(
            message: "Payment successful",
            backgroundColor: AppColors.kGreenColor,
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
