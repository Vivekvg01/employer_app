import 'dart:convert';
import 'dart:developer';
import 'package:employer_app/app/modules/recharge/models/purchase_history_model.dart';
import 'package:employer_app/app/utils/const_values.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../utils/api_endpoints.dart';

class RechargeApi {
  Future<PurchaseHistoryModel?> getPurchaseHistory() async {
    const storage = FlutterSecureStorage();

    final employerId = await storage.read(key: 'employerId');
    final token = await storage.read(key: 'token');
    final url = Uri.parse('${ApiEndPoints().kBaseUrl}/mypost/$employerId');

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

  void verifyPayment({
    String? orderid,
    String? paymentId,
    String? signature,
    String? amount,
  }) async {
    Map<String, dynamic> reqBody = {
      'razorpay_order_id': orderid,
      'razorpay_paymemt_id': paymentId,
      'razorpay_signature': signature,
    };

    const storage = FlutterSecureStorage();
    final employerId = await storage.read(key: 'employerId');

    final url = Uri.parse(
        '${ApiEndPoints().kBaseUrl}/credit/paymentVerification?userId=$employerId&amount=$amount&user=$userType');
    try {
      http.Response response = await http.post(
        url,
        body: reqBody,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('payment verified');
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
