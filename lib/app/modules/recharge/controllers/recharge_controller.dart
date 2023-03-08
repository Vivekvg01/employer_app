import 'dart:convert';
import 'package:employer_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:employer_app/app/modules/recharge/api/recharge_api.dart';
import 'package:employer_app/app/modules/recharge/models/purchase_history_model.dart';
import 'package:employer_app/app/modules/recharge/razorpay/razor_credentials.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/purchase_details_model.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;

class RechargeController extends GetxController
    with GetTickerProviderStateMixin {
  RxInt totalBalance = 0.obs;

  String? email;
  String? username;

  final profileController = Get.put(ProfileController());

  @override
  void onInit() {
    username = profileController.name;
    email = profileController.email;
    tabController = TabController(length: 2, vsync: this);
    addRazorpayliteners();
    getPurchaseHistory();
    update();
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

  int? purchaseAmount;

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    if (response.orderId != null &&
        response.paymentId != null &&
        response.signature != null &&
        purchaseAmount != null) {
      RechargeApi().verifyPayment(
        orderid: response.orderId!,
        paymentId: response.paymentId!,
        signature: response.signature!,
        amount: (purchaseAmount! * 100).toString(),
      );
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    Get.showSnackbar(
      GetSnackBar(
        message: response.message,
        backgroundColor: AppColors.kredColor,
        duration: const Duration(seconds: 3),
        snackStyle: SnackStyle.FLOATING,
      ),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    // print(response);
  }

  //create order
  void createOrder(int amount) async {
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

  openGateway(String orderId, int amount) {
    purchaseAmount = amount;
    var options = {
      'key': RazorCredential.keyId,
      'amount': amount * 100,
      'name': 'Get worker',
      'order_id': orderId, // Generate order_id using Orders API
      'description': 'Add credits',
      'image':
          'https://res.cloudinary.com/dpiah7oyh/image/upload/v1666255506/GetworkerProfileImg/ezhbbjrlmfvbefegcfq2.png',
      'timeout': 60 * 5, //In seconds // 5 minutes
      'prefill': {
        'name': username,
        'email': email,
      },
      'notes': {
        'address': "Razorpay Corporate Office",
      },
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
                DataCell(Text((i + 1).toString())),
                DataCell(Text(purchaseDetailsList[i]!.orderId.toString())),
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
