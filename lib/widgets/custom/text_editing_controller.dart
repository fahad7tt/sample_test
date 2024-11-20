import 'package:flutter/material.dart';

class TextEditingControllerManager {
  // Declare controllers for text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  // Dispose of controllers
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    placeController.dispose();
    jobController.dispose();
    mobileController.dispose();
  }

  // Reset controllers
  void reset() {
    nameController.clear();
    ageController.clear();
    placeController.clear();
    jobController.clear();
    mobileController.clear();
  }
}