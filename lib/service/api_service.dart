import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sample_test/model/beneficiary_model.dart';

class ApiService {
  final String loginUrl = "https://api.postman.com/collections/31889484-b71f2d67-1a3a-4449-945d-bc3a1cb12387?access_key=PMAT-01JCZWMD5P4VCVPFP7BGHWET8N";

  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse(loginUrl),
      body: {'username': username, 'password': password},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<List<Beneficiary>> getBeneficiaries() async {
  final response = await http.get(Uri.parse('YOUR_API_ENDPOINT'));
  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Beneficiary.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load beneficiaries');
  }
}


  //Add CRUD operation logic for beneficiaries
}
