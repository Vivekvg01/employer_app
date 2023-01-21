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

  Future<List<GetAllEmployee>?> searchEmployee(String query) async {
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
        final data = json.decode(response.body) as List;
        return data.map((e) => GetAllEmployee.fromJson(e)).toList();
      }
    } catch (e) {
      throw Exception("Failed to Load data"); 
    }
    return null;
  }
}
