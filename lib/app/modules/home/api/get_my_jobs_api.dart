import 'dart:convert';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class GetMyJobsApi {
   void getMyjobs() async {
    final url =
        Uri.parse('http://10.0.2.2:3001/api/mypost/639809f2a527d75011eb2c03');
    const storage = FlutterSecureStorage();

    final token = await storage.read(key: 'token');
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
      var respData = jsonDecode(response.body);
      log(respData.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
