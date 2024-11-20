// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sample_test/service/api_service.dart';

class AddBeneficiaryPage extends StatefulWidget {
  const AddBeneficiaryPage({super.key});

  @override
  _AddBeneficiaryPageState createState() => _AddBeneficiaryPageState();
}

class _AddBeneficiaryPageState extends State<AddBeneficiaryPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final TextEditingController houseNameController = TextEditingController();
  final TextEditingController wardNoController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController aadhaarController = TextEditingController();
  final TextEditingController residentialNumberController = TextEditingController();
  final TextEditingController electricPostController = TextEditingController();
  final TextEditingController roadNameController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController postOfficeController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController marriedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Beneficiary')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Name Validation (only alphabets, min 3 characters)
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

              // Age Validation (only numbers, max 2 digits)
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

              // Mobile Number Validation (exactly 10 digits)
              TextFormField(
                controller: mobileController,
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(labelText: 'Mobile Number'),
                validator: (value) {
                  if (value!.isEmpty ||
                      value.length != 10 ||
                      !RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Please enter a valid 10-digit mobile number';
                  }
                  return null;
                },
              ),

              // Job Validation (only alphabets, min 3 characters)
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

              // Ward No Validation (max 2 digits)
              TextFormField(
                controller: wardNoController,
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(labelText: 'Ward No'),
                validator: (value) {
                  if (value!.isEmpty ||
                      value.length > 2 ||
                      !RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Please enter a valid ward number (max 2 digits)';
                  }
                  return null;
                },
              ),

              // Aadhaar Number Validation (exactly 12 digits)
              TextFormField(
                controller: aadhaarController,
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(labelText: 'Aadhaar Number'),
                validator: (value) {
                  if (value!.isEmpty ||
                      value.length != 12 ||
                      !RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Please enter a valid 12-digit Aadhaar number';
                  }
                  return null;
                },
              ),

              // Residential Number Validation (max 3 digits)
              TextFormField(
                controller: residentialNumberController,
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(labelText: 'Residential Number'),
                validator: (value) {
                  if (value!.isEmpty ||
                      value.length > 3 ||
                      !RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Please enter a valid residential number (max 3 digits)';
                  }
                  return null;
                },
              ),

              // Electric Post Number Validation (max 3 digits)
              TextFormField(
                controller: electricPostController,
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(labelText: 'Electric Post Number'),
                validator: (value) {
                  if (value!.isEmpty ||
                      value.length > 3 ||
                      !RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Please enter a valid electric post number (max 3 digits)';
                  }
                  return null;
                },
              ),

              // Road Name Validation (only alphabets, min 3 characters)
              TextFormField(
                controller: roadNameController,
                decoration: const InputDecoration(labelText: 'Road Name'),
                validator: (value) {
                  if (value!.isEmpty ||
                      value.length < 3 ||
                      !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                    return 'Please enter a valid road name (at least 3 characters)';
                  }
                  return null;
                },
              ),

              // Place Validation (only alphabets, min 3 characters)
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

              // Post Office Validation (only alphabets, min 3 characters)
              TextFormField(
                controller: postOfficeController,
                decoration: const InputDecoration(labelText: 'Post Office'),
                validator: (value) {
                  if (value!.isEmpty ||
                      value.length < 3 ||
                      !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                    return 'Please enter a valid post office (at least 3 characters)';
                  }
                  return null;
                },
              ),

              // Landmark Validation (only alphabets, min 3 characters)
              TextFormField(
                controller: landmarkController,
                decoration: const InputDecoration(labelText: 'Landmark'),
                validator: (value) {
                  if (value!.isEmpty ||
                      value.length < 3 ||
                      !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                    return 'Please enter a valid landmark (at least 3 characters)';
                  }
                  return null;
                },
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final newBeneficiary = {
                        'name': nameController.text,
                        'age': int.parse(ageController.text),
                        'mobile_number': mobileController.text,
                        'job': jobController.text,
                        'house_name': houseNameController.text,
                        'ward_no': wardNoController.text,
                        'education': educationController.text,
                        'aadhaar_number': aadhaarController.text,
                        'residential_number': residentialNumberController.text,
                        'electric_post_number': electricPostController.text,
                        'road_name': roadNameController.text,
                        'place': placeController.text,
                        'post_office': postOfficeController.text,
                        'landmark': landmarkController.text,
                        'married': true,
                      };

                      try {
                        await ApiService.createBeneficiary(newBeneficiary);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Beneficiary added successfully')),
                        );
                        Navigator.pop(context, true);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Failed to add beneficiary: $e')),
                        );
                      }
                    }
                  },
                  child: const Text('Add Beneficiary'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}