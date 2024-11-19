import 'package:flutter/material.dart';
import 'package:sample_test/service/api_service.dart';

class BeneficiaryProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<dynamic> _beneficiaries = [];

  List<dynamic> get beneficiaries => _beneficiaries;

  Future<void> fetchBeneficiaries() async {
    _beneficiaries = (await _apiService.getBeneficiaries());
    notifyListeners();
  }

  Future<void> deleteBeneficiary(String id) async {
    // Implement delete logic here
    notifyListeners();
  }
}
