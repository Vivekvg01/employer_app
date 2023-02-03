import 'dart:convert';
import 'package:employer_app/app/modules/recharge/api/recharge_api.dart';
import 'package:employer_app/app/modules/recharge/models/purchase_history_model.dart';
import 'package:employer_app/app/modules/recharge/razorpay/razor_credentials.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/purchase_details_model.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;

class RechargeController extends GetxController
    with GetTickerProviderStateMixin {
  RxInt totalBalance = 0.obs;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    addRazorpayliteners();
    getPurchaseHistory();
    super.onInit();
  }

  final razorPay = Razorpay();

  void addRazorpayliteners() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    RechargeApi().verifyPayment(
      orderid: response.orderId,
      paymentId: response.paymentId,
      signature: response.signature,
      amount: '500000',
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print(response);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    print(response);
  }

  //create order
  void createOrder(double amount) async {
    String userName = RazorCredential.keyId;
    String password = RazorCredential.keySecret;

    String baseAuth =
        'Basic ${base64Encode(utf8.encode('$userName:$password'))}';

    Map<String, dynamic> body = {
      "amount": amount * 100,
      "currency": "INR",
      "receipt": "rcptid_11"
    };

    var res = await http.post(
      Uri.https("api.razorpay.com", "v1/orders"),
      headers: {
        "Content-Type": "application/json",
        "authorization": baseAuth,
      },
      body: jsonEncode(body),
    );
    if (res.statusCode == 200) {
      openGateway(jsonDecode(res.body)['id'], amount);
    }
  }

  openGateway(String orderId, double amount) {
    var options = {
      'key': RazorCredential.keyId,
      'amount': amount * 100,
      'name': 'Ger worker',
      'order_id': orderId, // Generate order_id using Orders API
      'description': 'Add credits',
      'timeout': 60 * 5, //In seconds // 5 minutes
      'prefill': {
        'contact': '8921923419',
        'email': 'vivek@gmail.com',
      }
    };
    razorPay.open(options);
  }

  late TabController tabController;

  final List<Tab> tabs = [
    const Tab(text: "BUY CONNECTS"),
    const Tab(text: "RECHARGE HISTORY"),
  ];

  RxList<Detail?> purchaseDetailsList = <Detail>[].obs;
  RxList<DataRow> dataRows = <DataRow>[].obs;

  void getPurchaseHistory() async {
    PurchaseHistoryModel? response = await RechargeApi().getPurchaseHistory();

    if (response != null) {
      if (response.details != null) {
        purchaseDetailsList.value = response.details!;
        for (int i = 0; i < purchaseDetailsList.length; i++) {
          dataRows.add(
            DataRow(
              cells: [
                DataCell(Text((i+1).toString())), 
                DataCell(Text(purchaseDetailsList[i]!.orderId.toString())),
                DataCell(Text(purchaseDetailsList[i]!.paymentId.toString())),
                DataCell(Text(purchaseDetailsList[i]!.amount.toString())),
              ],
            ),
          );
        }
      }
    }
  }

  @override
  void dispose() {
    razorPay.clear();
    super.dispose();
  }
}
