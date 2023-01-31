import 'dart:convert';
import 'dart:developer';

import 'package:employer_app/app/utils/api_endpoints.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AllChatsApi {
  void getAllChats() async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    final employerId = await storage.read(key: 'employerId');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final url =
        Uri.parse('${ApiEndPoints().kBaseUrl}/chat/myChats/$employerId');

    try {
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final data = jsonEncode(response.body);
        
      }
    } catch (e) {}
  }
}
