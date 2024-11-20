// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:sample_test/service/api_service.dart';
import 'package:sample_test/widgets/beneficiaries/beneficiary_fields.dart';
import 'package:sample_test/widgets/beneficiaries/beneficiary_text_controllers.dart';

class AddBeneficiaryPage extends StatefulWidget {
  const AddBeneficiaryPage({super.key});

  @override
  State<AddBeneficiaryPage> createState() => _AddBeneficiaryPageState();
}

class _AddBeneficiaryPageState extends State<AddBeneficiaryPage> {
  final _formKey = GlobalKey<FormState>();
  final _controllers = BeneficiaryTextControllers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Beneficiary'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: BeneficiaryFields(
            controllers: _controllers,
            onSave: _saveBeneficiary,
          ),
        ),
      ),
    );
  }

  Future<void> _saveBeneficiary() async {
    if (_formKey.currentState!.validate()) {
      final newBeneficiary = _controllers.toMap();

      try {
        await ApiService.createBeneficiary(newBeneficiary);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Beneficiary added successfully')),
        );
        Navigator.pop(context, true);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add beneficiary: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _controllers.dispose(); // Dispose controllers to prevent memory leaks
    super.dispose();
  }
}