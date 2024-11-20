import 'package:flutter/material.dart';
import 'package:sample_test/widgets/beneficiary_text_controllers.dart';
import 'package:sample_test/widgets/custom_text_field.dart';

class BeneficiaryFields extends StatelessWidget {
  final BeneficiaryTextControllers controllers;
  final Future<void> Function() onSave;

  const BeneficiaryFields({
    super.key,
    required this.controllers,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomTextFormField(
          controller: controllers.nameController,
          label: 'Name',
          hintText: 'Enter full name',
          prefixIcon: Icons.person,
          validator: (value) {
            if (value!.length < 3 || !RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
              return 'Please enter a valid name (at least 3 characters)';
            }
            return null;
          },
        ),
        CustomTextFormField(
          controller: controllers.ageController,
          label: 'Age',
          hintText: 'Enter age',
          keyboardType: TextInputType.number,
          prefixIcon: Icons.cake,
          validator: (value) {
            if (int.tryParse(value ?? '') == null || value!.length > 2) {
              return 'Please enter a valid age (max 2 digits)';
            }
            return null;
          },
        ),
        CustomTextFormField(
          controller: controllers.placeController,
          label: 'Place',
          hintText: 'Enter place',
          prefixIcon: Icons.place,
          validator: (value) {
            if (value!.length < 3 || !RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
              return 'Please enter a valid place (at least 3 characters)';
            }
            return null;
          },
        ),
        CustomTextFormField(
          controller: controllers.mobileController,
          label: 'Mobile Number',
          hintText: 'Enter 10-digit mobile number',
          keyboardType: TextInputType.phone,
          prefixIcon: Icons.phone,
          maxLength: 10,
          validator: (value) {
            if (!RegExp(r'^\d{10}$').hasMatch(value ?? '')) {
              return 'Please enter a valid 10-digit mobile number';
            }
            return null;
          },
        ),
        CustomTextFormField(
          controller: controllers.jobController,
          label: 'Job',
          hintText: 'Enter occupation',
          prefixIcon: Icons.work,
          validator: (value) {
            if (value!.length < 3 || !RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
              return 'Please enter a valid job (at least 3 characters)';
            }
            return null;
          },
        ),
        CustomTextFormField(
          controller: controllers.educationController,
          label: 'Education',
          hintText: 'Enter education',
          prefixIcon: Icons.school,
          validator: (value) {
            if (value!.length < 3 || !RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
              return 'Please enter a valid education (at least 3 characters)';
            }
            return null;
          },
        ),
        CustomTextFormField(
          controller: controllers.houseNameController,
          label: 'House Name',
          hintText: 'Enter house name',
          prefixIcon: Icons.home,
          validator: (value) {
            if (value!.length < 3 || !RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
              return 'Please enter a valid house name (at least 3 characters)';
            }
            return null;
          },
        ),
        CustomTextFormField(
          controller: controllers.wardNoController,
          label: 'Ward No',
          hintText: 'Enter ward number',
          keyboardType: TextInputType.number,
          prefixIcon: Icons.holiday_village,
          validator: (value) {
            if (!RegExp(r'^\d{1,2}$').hasMatch(value ?? '')) {
              return 'Please enter a valid ward number (1-2 digits)';
            }
            return null;
          },
        ),
        CustomTextFormField(
          controller: controllers.aadhaarController,
          label: 'Aadhaar Number',
          hintText: 'Enter 12-digit Aadhaar number',
          keyboardType: TextInputType.number,
          prefixIcon: Icons.credit_card,
          maxLength: 12,
          validator: (value) {
            if (!RegExp(r'^\d{12}$').hasMatch(value ?? '')) {
              return 'Please enter a valid 12-digit Aadhaar number';
            }
            return null;
          },
        ),
        CustomTextFormField(
          controller: controllers.residentialNumberController,
          label: 'Residential Number',
          hintText: 'Enter residential number',
          keyboardType: TextInputType.number,
          prefixIcon: Icons.home_work,
          validator: (value) {
            if (!RegExp(r'^\d{1,3}$').hasMatch(value ?? '')) {
              return 'Please enter a valid residential number (max 3 digits)';
            }
            return null;
          },
        ),
        CustomTextFormField(
          controller: controllers.electricPostController,
          label: 'Electric Post Number',
          hintText: 'Enter electric post number',
          keyboardType: TextInputType.number,
          prefixIcon: Icons.electrical_services,
          validator: (value) {
            if (!RegExp(r'^\d{1,3}$').hasMatch(value ?? '')) {
              return 'Please enter a valid electric post number (max 3 digits)';
            }
            return null;
          },
        ),
        CustomTextFormField(
          controller: controllers.roadNameController,
          label: 'Road Name',
          hintText: 'Enter road name',
          prefixIcon: Icons.aod,
          validator: (value) {
            if (value!.length < 3 || !RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
              return 'Please enter a valid road name (at least 3 characters)';
            }
            return null;
          },
        ),
        CustomTextFormField(
          controller: controllers.postOfficeController,
          label: 'Post Office',
          hintText: 'Enter post office',
          prefixIcon: Icons.local_post_office,
          validator: (value) {
            if (value!.length < 3 || !RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
              return 'Please enter a valid post office (at least 3 characters)';
            }
            return null;
          },
        ),
        CustomTextFormField(
          controller: controllers.landmarkController,
          label: 'Landmark',
          hintText: 'Enter landmark',
          prefixIcon: Icons.location_city,
          validator: (value) {
            if (value!.length < 3 || !RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
              return 'Please enter a valid landmark (at least 3 characters)';
            }
            return null;
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
            onPressed: onSave,
            child: const Text('Add Beneficiary'),
          ),
        ),
      ],
    );
  }
}