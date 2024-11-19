import 'package:flutter/material.dart';
import 'package:sample_test/model/beneficiary_model.dart';

class BeneficiaryListItem extends StatelessWidget {
  final Beneficiary beneficiary;

  const BeneficiaryListItem({Key? key, required this.beneficiary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(beneficiary.name),
      subtitle: Text(beneficiary.details),
    );
  }
}
