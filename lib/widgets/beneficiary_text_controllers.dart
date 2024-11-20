import 'package:flutter/material.dart';

class BeneficiaryTextControllers {
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

  /// Converts all controller values to a Map
  Map<String, dynamic> toMap() {
    return {
      'name': nameController.text,
      'age': int.tryParse(ageController.text) ?? 0,
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
      'married': marriedController.text.toLowerCase() == 'true', // Convert string to boolean
    };
  }

  /// Dispose all controllers to prevent memory leaks
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    mobileController.dispose();
    jobController.dispose();
    houseNameController.dispose();
    wardNoController.dispose();
    educationController.dispose();
    aadhaarController.dispose();
    residentialNumberController.dispose();
    electricPostController.dispose();
    roadNameController.dispose();
    placeController.dispose();
    postOfficeController.dispose();
    landmarkController.dispose();
    marriedController.dispose();
  }
}
