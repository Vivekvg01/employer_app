import 'dart:convert';
import 'dart:developer';
import 'package:employer_app/app/modules/findTalent/models/all_employees/all_employees_model.dart';
import 'package:employer_app/app/utils/api_endpoints.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class GetAllEmployeeApi {
  Future<GetAllEmployee?> getAllEmpolyees() async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');

    final url = Uri.parse('${ApiEndPoints().kBaseUrl}/employer/allEmployees');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        GetAllEmployee respModel = GetAllEmployee.fromJson(data);
        return respModel;
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
    return null;
  }

  Future<GetAllEmployee?> searchEmployee(String query) async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');

    final url = Uri.parse(
        '${ApiEndPoints().kBaseUrl}/employer/allEmployees?keyword=$query&earnings=&language=&jobsDone=&pageNumber=1');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        log(response.body);
        final data = json.decode(response.body);
        return GetAllEmployee.fromJson(data);
      }
    } catch (e) {
      throw Exception("Failed to Load data");
    }
    return null;
  }

  void saveTalends(String employeeId) async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');

    final url = Uri.parse(
        '${ApiEndPoints().kBaseUrl}/saveTalents/639809f2a527d75011eb2c03');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    Map<String, dynamic> requestBody = {
      "id": employeeId,
    };

    final jsonReq = jsonEncode(requestBody);

    try {
      http.Response response =
          await http.patch(url, headers: headers, body: jsonReq);
      log(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}
