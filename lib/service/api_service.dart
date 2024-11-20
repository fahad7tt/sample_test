// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://zakath.cloudocz.com/api';
  static const String _token = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3pha2F0aC5jbG91ZG9jei5jb20vYXBpL2xvZ2luIiwiaWF0IjoxNzMyMTM0NDg3LCJleHAiOjE3MzIxMzgwODcsIm5iZiI6MTczMjEzNDQ4NywianRpIjoibkR3M01vV2FTdUJUNzlBQyIsInN1YiI6IjIyIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.WculRMjY-BdiDR6BOGkcTP8nc9dyIAOVHf7y6U81om4';

  static Map<String, String> get _headers => {
        'Authorization': _token,
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

  // Fetch Beneficiaries
  static Future<List<dynamic>> fetchBeneficiaries() async {
  final url = Uri.parse('$_baseUrl/beneficiaries');
  final response = await http.get(url, headers: _headers);

  // Debugging logs to inspect response
  print('Response Status: ${response.statusCode}');
  print('Response Headers: ${response.headers}');
  print('Response Body: ${response.body}');

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data is List) {
      return data;  // Directly return if the response is a list
    } else if (data['beneficiaries'] != null) {
      return data['beneficiaries'] ?? [];
    } else {
      return [];
    }
  } else {
    throw Exception('Failed to load beneficiaries: ${response.body}');
  }
}

  // Create Beneficiary
  static Future<void> createBeneficiary(Map<String, dynamic> body) async {
  final response = await http.post(
    Uri.parse('$_baseUrl/beneficiaries'),
    headers: _headers,
    body: json.encode(body),
  );

  print('Status Code: ${response.statusCode}');
  print('Response Body: ${response.body}');

  if (response.statusCode == 200 || response.statusCode == 201) {
    final responseData = json.decode(response.body);
    if (responseData['status'] == 'success') {
      print('Beneficiary created successfully');
    } else {
      print('Failed to create beneficiary: ${response.body}');
      throw Exception(responseData['message'] ?? 'Unknown error occurred');
    }
  } else {
    print('Failed to create beneficiary: ${response.body}');
    throw Exception('Failed to create beneficiary');
  }
}

  // Update Beneficiary
  static Future<void> updateBeneficiary(int id, Map<String, dynamic> body) async {
    final response = await http.patch(
      Uri.parse('$_baseUrl/beneficiaries/$id'),
      headers: _headers,
      body: json.encode(body),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update beneficiary');
    }
  }

  // Delete Beneficiary
  static Future<void> deleteBeneficiary(int id) async {
    final response = await http.delete(
      Uri.parse('$_baseUrl/beneficiaries/$id'),
      headers: _headers,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete beneficiary');
    }
  }
}