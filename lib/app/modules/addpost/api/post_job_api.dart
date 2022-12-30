import 'dart:convert';
import 'dart:developer';
import 'package:employer_app/app/modules/addpost/models/request_model/pos_job_req_model.dart';
import 'package:employer_app/app/modules/addpost/models/response_model/post_job_response_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class PostJobApi {
  Future<PostJobResModel?> postJob(
    String title,
    String description,
    String budget,
    String deadline,
    String level,
    String searchTag,
  ) async {
    try {
      PostJobReqModel postJobReqModel = PostJobReqModel(
        title: title,
        description: description,
        budget: budget,
        deadline: deadline,
        level: level,
        searchTag: searchTag,
      );

      var reqJson = jsonEncode(postJobReqModel.toJson());

      const storage = FlutterSecureStorage();
      final token = await storage.read(key: 'token');

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final url = Uri.parse(
          'http://10.0.2.2:3001/api/postJob/639809f2a527d75011eb2c03');

      final response = await http.post(
        url,
        body: reqJson,
        headers: headers,
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        //log(response.body);
        final jsonResp = jsonDecode(response.body);

        PostJobResModel postJobReqModel = PostJobResModel.fromJson(jsonResp);
        return postJobReqModel;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
