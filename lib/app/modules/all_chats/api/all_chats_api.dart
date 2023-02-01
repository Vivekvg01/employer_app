import 'dart:convert';
import 'package:employer_app/app/modules/all_chats/models/my_chat_list_model.dart';
import 'package:employer_app/app/modules/all_chats/models/my_chats_model.dart';
import 'package:employer_app/app/utils/api_endpoints.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AllChatsApi {
  Future<MyChatsListModel?> getAllChats() async {
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
        List<dynamic> res = jsonDecode(response.body);
        List<MyChatModel> list =
            res.map((item) => MyChatModel.fromJson(item)).toList();
        return MyChatsListModel(list);
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }
}
