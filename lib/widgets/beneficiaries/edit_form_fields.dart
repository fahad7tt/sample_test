import 'package:flutter/material.dart';
import 'package:sample_test/widgets/custom/custom_text_field.dart';

class BeneficiaryFormFields {
  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final TextEditingController placeController = TextEditingController();

  // Initialization function for controllers
  void initializeControllers(Map beneficiary) {
    nameController.text = beneficiary['name'];
    ageController.text = beneficiary['age'].toString();
    mobileController.text = beneficiary['mobile_number'];
    jobController.text = beneficiary['job'];
    placeController.text = beneficiary['place'];
  }

  // List of custom form fields
  List<Widget> getFormFields() {
    return [
      CustomTextFormField(
        controller: nameController,
        label: 'Name',
        hintText: 'Enter full name',
        prefixIcon: Icons.person,
        validator: (value) {
          if (value!.isEmpty ||
              value.length < 3 ||
              !RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
            return 'Please enter a valid name (at least 3 characters)';
          }
          return null;
        },
      ),
      CustomTextFormField(
        controller: ageController,
        label: 'Age',
        hintText: 'Enter age',
        keyboardType: TextInputType.number,
        prefixIcon: Icons.cake,
        validator: (value) {
          if (value!.isEmpty ||
              int.tryParse(value) == null ||
              value.length > 2) {
            return 'Please enter a valid age (max 2 digits)';
          }
          return null;
        },
      ),
      CustomTextFormField(
        controller: placeController,
        label: 'Place',
        hintText: 'Enter place',
        prefixIcon: Icons.place,
        validator: (value) {
          if (value!.isEmpty ||
              value.length < 3 ||
              !RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
            return 'Please enter a valid place (at least 3 characters)';
          }
          return null;
        },
      ),
      CustomTextFormField(
        controller: jobController,
        label: 'Job',
        hintText: 'Enter occupation',
        prefixIcon: Icons.work,
        validator: (value) {
          if (value!.isEmpty ||
              value.length < 3 ||
              !RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
            return 'Please enter a valid job (at least 3 characters)';
          }
          return null;
        },
      ),
      CustomTextFormField(
        controller: mobileController,
        label: 'Mobile Number',
        hintText: 'Enter 10-digit mobile number',
        keyboardType: TextInputType.phone,
        prefixIcon: Icons.phone,
        maxLength: 10,
        validator: (value) {
          if (value!.isEmpty ||
              value.length != 10 ||
              !RegExp(r'^[0-9]+$').hasMatch(value)) {
            return 'Please enter a valid 10-digit mobile number';
          }
          return null;
        },
      ),
    ];
  }
}
