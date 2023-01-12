import 'dart:convert';
import 'dart:developer';
import 'package:employer_app/app/modules/employeeDetails/models/employee_details_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../utils/api_endpoints.dart';
import 'package:http/http.dart' as http;

class EmployeeDetailsApi {
  Future<GetEmployeeDetails?> getAllEmpolyee() async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');

    final url = Uri.parse(
      '${ApiEndPoints().kBaseUrl}/employee/profile/635a3fd1779ecd0929d02e56',
    );

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
        final data = json.decode(response.body);
        GetEmployeeDetails respModel = GetEmployeeDetails.fromJson(data);
        return respModel;
      } else if (response.statusCode == 404) {
        log(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
