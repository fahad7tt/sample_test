// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:sample_test/service/api_service.dart';

class EditBeneficiaryPage extends StatefulWidget {
  final dynamic beneficiary;

  const EditBeneficiaryPage({super.key, required this.beneficiary});

  @override
  _EditBeneficiaryPageState createState() => _EditBeneficiaryPageState();
}

class _EditBeneficiaryPageState extends State<EditBeneficiaryPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController mobileController;
  late TextEditingController jobController;
  late TextEditingController placeController;

  @override
  void initState() {
    super.initState();

    // Initialize controllers with existing beneficiary data
    nameController = TextEditingController(text: widget.beneficiary['name']);
    ageController =
        TextEditingController(text: widget.beneficiary['age'].toString());
    mobileController =
        TextEditingController(text: widget.beneficiary['mobile_number']);
    jobController = TextEditingController(text: widget.beneficiary['job']);
    placeController = TextEditingController(text: widget.beneficiary['place']);
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
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty ||
                      value.length < 3 ||
                      !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                    return 'Please enter a valid name (at least 3 characters)';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: ageController,
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(labelText: 'Age'),
                validator: (value) {
                  if (value!.isEmpty ||
                      int.tryParse(value) == null ||
                      value.length > 2) {
                    return 'Please enter a valid age (max 2 digits)';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: placeController,
                decoration: const InputDecoration(labelText: 'Place'),
                validator: (value) {
                  if (value!.isEmpty ||
                      value.length < 3 ||
                      !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                    return 'Please enter a valid place (at least 3 characters)';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: jobController,
                decoration: const InputDecoration(labelText: 'Job'),
                validator: (value) {
                  if (value!.isEmpty ||
                      value.length < 3 ||
                      !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                    return 'Please enter a valid job (at least 3 characters)';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: mobileController,
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(labelText: 'Mobile'),
                validator: (value) {
                  if (value!.isEmpty ||
                      value.length != 10 ||
                      !RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Please enter a valid 10-digit mobile number';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final updatedBeneficiary = {
                        'name': nameController.text,
                        'age': int.parse(ageController.text),
                        'mobile_number': mobileController.text,
                        'job': jobController.text,
                        'place': placeController.text,
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
