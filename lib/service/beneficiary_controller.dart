import 'package:flutter/material.dart';
import 'package:sample_test/service/api_service.dart';

class BeneficiaryController {
  static Future<List<dynamic>> loadBeneficiaries(BuildContext context) async {
    try {
      return await ApiService.fetchBeneficiaries();
    } catch (e) {
      // To check if the widget is still mounted before showing the SnackBar
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load beneficiaries: $e')),
        );
      }
      return [];
    }
  }

  static Future<void> deleteBeneficiary(int id, BuildContext context) async {
    try {
      await ApiService.deleteBeneficiary(id);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Beneficiary deleted successfully')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete beneficiary: $e')),
        );
      }
    }
  }
}
