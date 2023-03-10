import 'dart:convert';
import 'dart:developer';
import 'package:employer_app/app/modules/jobDetails/model/job_details_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../../utils/api_endpoints.dart';
import 'package:http/http.dart' as http;
import '../../../utils/app_colors.dart';

class JobDetailsApi {
  Future<JobDetailsModel?> getJobDetails(String jobId) async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final url = Uri.parse('${ApiEndPoints().kBaseUrl}/jobs/$jobId');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        JobDetailsModel respModel = JobDetailsModel.fromJson(data);
        return respModel;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  // cancel jobs
  Future<void> cancelJob(String jobid) async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final empolyerId = await storage.read(key: 'employerId');
    final url =
        Uri.parse('${ApiEndPoints().kBaseUrl}/jobsStatus/$empolyerId/$jobid');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 201) {
        Get.showSnackbar(
          GetSnackBar(
            message: 'Job Cancelled',
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

  Future<void> approveJob(String jobid) async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final empolyerId = await storage.read(key: 'employerId');
    final url =
        Uri.parse('${ApiEndPoints().kBaseUrl}//approveJob/$empolyerId/$jobid');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        Get.showSnackbar(
          GetSnackBar(
            message: 'Proposal Approved',
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
