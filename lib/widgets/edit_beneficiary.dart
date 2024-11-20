// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:sample_test/service/api_service.dart';
import 'package:sample_test/widgets/edit_form_fields.dart';

class EditBeneficiaryPage extends StatefulWidget {
  final dynamic beneficiary;

  const EditBeneficiaryPage({super.key, required this.beneficiary});

  @override
  _EditBeneficiaryPageState createState() => _EditBeneficiaryPageState();
}

class _EditBeneficiaryPageState extends State<EditBeneficiaryPage> {
  final _formKey = GlobalKey<FormState>();

  late BeneficiaryFormFields beneficiaryFormFields;

  @override
  void initState() {
    super.initState();
    beneficiaryFormFields = BeneficiaryFormFields();
    beneficiaryFormFields.initializeControllers(widget.beneficiary); // Initialize the controllers with beneficiary data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Beneficiary')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Using the getFormFields method to retrieve all form fields
              ...beneficiaryFormFields.getFormFields(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final updatedBeneficiary = {
                        'name': beneficiaryFormFields.nameController.text,
                        'age': int.parse(beneficiaryFormFields.ageController.text),
                        'mobile_number': beneficiaryFormFields.mobileController.text,
                        'job': beneficiaryFormFields.jobController.text,
                        'place': beneficiaryFormFields.placeController.text,
                      };

                      try {
                        await ApiService.updateBeneficiary(
                          widget.beneficiary['id'],
                          updatedBeneficiary,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Beneficiary updated successfully')),
                        );
                        Navigator.pop(context, true);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Failed to update beneficiary: $e')),
                        );
                      }
                    }
                  },
                  child: const Text('Update Beneficiary'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
