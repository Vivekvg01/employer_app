import 'dart:convert';
import 'package:employer_app/app/modules/proposal_details/model/proposal_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../utils/api_endpoints.dart';
import 'package:http/http.dart' as http;

class ProposalDetailsApi {
  Future<ProposalDetailsModel?> getProfileDetails(String proposalId) async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final url = Uri.parse(
        '${ApiEndPoints().kBaseUrl}/viewProposal/63d6848da62afbe72e0ec395');

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

  void acceptProposal() {}
}
