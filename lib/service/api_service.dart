import 'dart:convert';
import 'package:http/http.dart' as http;

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

  // Future<List<dynamic>> getBeneficiaries() async {
  //   // Add API logic here for fetching beneficiaries
  // }

  // Add CRUD operation logic for beneficiaries
}
