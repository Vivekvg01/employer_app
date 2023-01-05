import 'dart:convert';
import 'dart:developer';
import 'package:employer_app/app/modules/home/models/get_myjobs_model.dart';
import 'package:employer_app/app/utils/api_endpoints.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class GetMyJobsApi {
  Future<MyJobs?> getMyjobs() async {
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
      final json = jsonDecode(response.body);
      MyJobs myJobsResp = MyJobs.fromJson(json);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
