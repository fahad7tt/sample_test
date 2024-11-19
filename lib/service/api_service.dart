import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sample_test/model/beneficiary_model.dart';

class ApiService {
  static const String baseUrl = 'https://zakath.cloudocz.com/api';

  static Future<String?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['token']; // Assuming API returns a token
    } else {
      return null;
    }
  }

  static Future<List<Beneficiary>> fetchBeneficiaries(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/beneficiaries'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((json) => Beneficiary.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load beneficiaries');
    }
  }
}
