import 'dart:convert';
import 'dart:developer';
import 'package:employer_app/app/modules/proposal_details/model/proposal_model.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../../utils/api_endpoints.dart';
import 'package:http/http.dart' as http;

class ProposalDetailsApi {
  Future<ProposalDetailsModel?> getProposalDetails(String proposalId) async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final url =
        Uri.parse('${ApiEndPoints().kBaseUrl}/viewProposal/$proposalId');

    try {
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ProposalDetailsModel.fromJson(data);
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }

  //accept proposal
  void acceptProposal(String proposalId, int totalAmount) async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final employerId = await storage.read(key: 'employerId');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final url = Uri.parse(
        '${ApiEndPoints().kBaseUrl}/acceptProposal/$employerId/$proposalId');

    var reqBody = {
      'totalAmount': totalAmount,
    };

    try {
      http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(reqBody),
      );
      if (response.statusCode == 200) {
        Get.showSnackbar(
          GetSnackBar(
            message: 'Proposal Accepted',
            backgroundColor: AppColors.kGreenColor,
            duration: const Duration(seconds: 3),
            snackStyle: SnackStyle.FLOATING,
          ),
        );
      } else if (response.statusCode == 404) {
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

  //shortlisted proposal
  void shortlistProposal(String? propsalId) async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final employerId = await storage.read(key: 'employerId');
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final url = Uri.parse(
        '${ApiEndPoints().kBaseUrl}/updateProposal/$employerId/$propsalId');

    try {
      http.Response response = await http.patch(url, headers: headers);
      log(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }

  //rejected proposal
  void rejectedProsal(String? propsalId, int? totalAmount) async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final employerId = await storage.read(key: 'employerId');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final url = Uri.parse(
        '${ApiEndPoints().kBaseUrl}/updateProposal/$employerId/$propsalId');

    try {
      http.Response response = await http.patch(url, headers: headers);
    } catch (e) {
      throw Exception(e);
    }
  }
}
